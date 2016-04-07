package data.horizon.core.config.model;

/**
 * Created by huyang on 2016/2/26.
 */
public class JobGroup {
  int id;
  String name;
  String enable;
  String desc;

  public JobGroup(){}

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getEnable() {
    return enable;
  }

  public void setEnable(String enable) {
    this.enable = enable;
  }

  public String getDesc() {
    return desc;
  }

  public void setDesc(String desc) {
    this.desc = desc;
  }
}
