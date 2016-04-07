package data.horizon.analysis.sql;

import data.horizon.analysis.Operation;
import org.antlr.runtime.tree.CommonTree;
import org.antlr.runtime.tree.Tree;
import org.apache.hadoop.hive.ql.parse.ASTNode;

import java.util.*;
import java.util.concurrent.LinkedBlockingDeque;

/**
 * Created by huangshiqian on 15/12/21.
 */
public class HiveVisitor extends Visitor {

  @Override
  public void visit(CommonTree ast) {
    System.out.println(((ASTNode) ast).dump());

    Deque<Tree> stack = new LinkedBlockingDeque<>();

    stack.add(ast);

    Tree node = null;

    //记录解析到当前节点时的访问操作符
    Operation currOp = null;

    int child = 0;

    StringBuilder tableName = new StringBuilder();
//    StringBuilder dbName = new StringBuilder();

    tableAccessInfo = new HashMap<>();

    while(!stack.isEmpty()) {
      node = stack.pop();

      String operator = node.getText();

      System.out.println("======== node ========== " + node.getText() + " = " + node.getChildCount());

      if(child == 2) {
        // 记录表的所属DB
        tableName.append(operator);
//        dbName.append(operator);

        child --;
      } else if(child == 1) {
        //组装表名

        if(tableName.length() == 0) {
          tableName.append("default");
        }

        tableName.append(".").append(operator);

        // 将表名和记录的操作符保存
        addTableAccessInfo(tableAccessInfo, tableName.toString(), currOp);

        child --;
      } else {
        tableName.delete(0, tableName.length());
      }


      //记录当前操作符类型
      if("TOK_QUERY".equals(operator)) {
        currOp = Operation.SELECT;
      } else if("TOK_INSERT".equals(operator) || "TOK_CREATETABLE".equals(operator)) {
        currOp = Operation.INSERT;
      } else if("TOK_DELETE_FROM".equals(operator) || "TOK_TRUNCATE_TABLE".equals(operator)) {
        currOp = Operation.DELETE;
      } else if("TOK_UPDATE_TABLE".equals(operator)) {
        currOp = Operation.UPDATE;
      } else if("TOK_TABNAME".equals(operator)) {
        //碰到TOK_TABNAME时,记录其子节点个数,为2则代表有db,1则代表直接引用表
        child = node.getChildCount();
      }

      for(int i = node.getChildCount() - 1; i > -1; i --) {
        stack.push(node.getChild(i));
      }
    }
  }

  private void addTableAccessInfo(Map<String, Set<Operation>> tableAccessInfo, String s,
                                  Operation op) {
    Set<Operation> operationSet = tableAccessInfo.get(s);

    if(operationSet == null) {
      operationSet = new TreeSet<>();
      tableAccessInfo.put(s, operationSet);
    }

    operationSet.add(op);
  }
}
