package data.horizon.analysis.util;


import data.horizon.analysis.Operation;
import data.horizon.analysis.Resource;
import data.horizon.analysis.Type;

import java.util.Map;
import java.util.Set;

/**
 * Created by huyang on 2016/1/8.
 */
public class BaseInfo implements Resource {

  private String name;
  protected Map<Operation,Set<String>> tableAccessInfo;

  public BaseInfo(String name)
  {
    this.name = name;
  }

  @Override
  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Map<Operation, Set<String>> getTableAccessInfo() {
    return tableAccessInfo;
  }

  public void setTableAccessInfo(Map<Operation, Set<String>> tableAccessInfo) {
    this.tableAccessInfo = tableAccessInfo;
  }

  @Override
  public Type getType() {
    return Type.BASE;
  }

}
