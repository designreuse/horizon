package data.horizon.analysis.sql;

import data.horizon.analysis.Operation;
import org.antlr.runtime.tree.CommonTree;

import java.util.Map;
import java.util.Set;

/**
 * Created by huangshiqian on 15/12/21.
 */
public abstract class Visitor {
  protected Map<String, Set<Operation>> tableAccessInfo;
  protected Map<String, Set<Operation>> columnAccessInfo;
  protected Map<String, Set<Operation>> dbAccessInfo;
  protected Map<String, Set<Operation>> dbLinkAccessInfo;

  public Map<String, Set<Operation>> getTableAccessInfo() {
    return tableAccessInfo;
  }

  public void setTableAccessInfo(Map<String, Set<Operation>> tableAccessInfo) {
    this.tableAccessInfo = tableAccessInfo;
  }

  public Map<String, Set<Operation>> getColumnAccessInfo() {
    return columnAccessInfo;
  }

  public void setColumnAccessInfo(Map<String, Set<Operation>> columnAccessInfo) {
    this.columnAccessInfo = columnAccessInfo;
  }

  public Map<String, Set<Operation>> getDbAccessInfo() {
    return dbAccessInfo;
  }

  public void setDbAccessInfo(Map<String, Set<Operation>> dbAccessInfo) {
    this.dbAccessInfo = dbAccessInfo;
  }

  public Map<String, Set<Operation>> getDbLinkAccessInfo() {
    return dbLinkAccessInfo;
  }

  public void setDbLinkAccessInfo(Map<String, Set<Operation>> dbLinkAccessInfo) {
    this.dbLinkAccessInfo = dbLinkAccessInfo;
  }

  public abstract void visit(CommonTree ASTNode);
}
