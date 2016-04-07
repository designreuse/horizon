package data.horizon.analysis.sql;

import data.horizon.analysis.Operation;
import data.horizon.analysis.Visitor;
import org.antlr.runtime.tree.CommonTree;
import org.antlr.runtime.tree.Tree;
import org.apache.hadoop.hive.ql.parse.ASTNode;

import java.util.*;


/**
 * Created by huyang on 2015/12/23.
 */
public class HiveSqlVisitor extends Visitor<CommonTree> {

  private Stack<Tree> stack;
  private List<String> alias;

  private String dbName;
  private String tableName;

  //初始化成员变量
  public HiveSqlVisitor() {
    this.stack = new Stack<Tree>();
    this.alias = new LinkedList<String>();
  }

  public void visit(CommonTree ast) {
     /*测试打印AST的结构
    ASTNode root = (ASTNode) ast;
    System.out.println(root.dump());
    */
    analysisTableAccessInfo(ast);
  }

  //解析表的访问信息
  private void analysisTableAccessInfo(CommonTree ast)
  {
    Operation operation = null;
    stack.push(ast);
    while (!stack.empty()) {
      Tree node = stack.pop();
      //获取节点名称
      String nodeName = node.getText();
      //获取子节点数
      int children = node.getChildCount();
      //分析当前节点
      if (Token.TOK_TABNAME.toString().equals(nodeName)) {
        children = node.getChildCount();
        if (children == 2) {
          tableName = node.getChild(0).getText().toLowerCase() + "." + node.getChild(1).getText().toUpperCase();
          if(operation != null){addTableAccessInfo(operation,tableName);}
          continue;
        } else if (children == 1) {
          String tmpTableName = node.getChild(0).getText();
          if (dbName == null || "".equals(dbName)) {
            tableName =this.defaultDB + "." + tmpTableName.toUpperCase();
          } else {
            tableName = dbName + "." + tmpTableName.toUpperCase();
          }
          if(operation != null){
            addTableAccessInfo(operation,tableName);
          }
          continue;
        }
      } else if (Token.TOK_TABREF.toString().equals(nodeName) || Token.TOK_SUBQUERY.toString().equals(nodeName)) {
        operation = Operation.SELECT;
        if (children == 2) {
          if(dbName == null || "".equals(dbName)) {
            alias.add(this.defaultDB + "." + node.getChild(1).toString().toUpperCase());
          }else{
            alias.add(dbName + "." + node.getChild(1).toString().toUpperCase());
          }
        }
      } else if(Token.TOK_SWITCHDATABASE.toString().equals(nodeName)){
        dbName = node.getChild(0).getText().toLowerCase();
      }else if (Token.TOK_INSERT.toString().equals(nodeName)) {
        operation = Operation.INSERT;
      } else if (Token.TOK_CREATETABLE.toString().equals(nodeName)) {
        operation = Operation.CREATE;
      } else if (Token.TOK_DROPTABLE.toString().equals(nodeName)) {
        operation = Operation.DROP;
      } else if (Token.TOK_TRUNCATETABLE.toString().equals(nodeName)) {
        operation = Operation.TRUNCATE;
      } else if (Token.TOK_ALTERTABLE.toString().equals(nodeName)) {
        operation = Operation.ALTER;
      } else if (Token.TOK_LIKETABLE.toString().equals(nodeName)) {
        operation = Operation.CREATE_LIKE;
      }
      //将当前节点的子节点压入栈
      for (int i = children - 1; i > -1; i--) {
        stack.push(node.getChild(i));
      }
    }
    //删除非实体表的访问信息
    if(alias.size() != 0) {
      delAliasTableAccessInfo(this.getTableAccessInfo());
    }

  }

  private void addTableAccessInfo(Operation operation,String tableName) {
    if (this.tableAccessInfo == null) {
      this.tableAccessInfo = new HashMap<Operation,Set<String>>();
      Set<String> set = new HashSet<String>();
      set.add(tableName);
      this.tableAccessInfo.put(operation,set);
      System.out.println(tableAccessInfo.values().size());
    } else {
      if (this.tableAccessInfo.containsKey(operation)) {
        this.tableAccessInfo.get(operation).add(tableName);
      } else {
        Set<String> set = new HashSet<String>();
        set.add(tableName);
        this.tableAccessInfo.put(operation, set);
      }
    }
  }

  private void delAliasTableAccessInfo(Map<Operation, Set<String>> tableAccessInfo) {
    for(Set<String> set:tableAccessInfo.values())
    {
      Iterator<String> iterator = set.iterator();
      while(iterator.hasNext())
      {
        if(alias.contains(iterator.next())){
          iterator.remove();
        }
      }
    }
  }
}
