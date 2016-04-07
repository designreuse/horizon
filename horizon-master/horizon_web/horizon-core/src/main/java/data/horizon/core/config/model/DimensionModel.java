package data.horizon.core.config.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * Created by huangshiqian on 15/11/14.
 */
public class DimensionModel {
  private int id;
  private String name;
  private String name_zh;
  private String manager;
  private String type;
  private String desc;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp create_time;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp update_time;

  public Timestamp getCreate_time() {
    return create_time;
  }

  public void setCreate_time(Timestamp create_time) {
    this.create_time = create_time;
  }

  public String getDesc() {
    return desc;
  }

  public void setDesc(String desc) {
    this.desc = desc;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getManager() {
    return manager;
  }

  public void setManager(String manager) {
    this.manager = manager;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getName_zh() {
    return name_zh;
  }

  public void setName_zh(String name_zh) {
    this.name_zh = name_zh;
  }

  public String getType() {
    return type;
  }

  public void setType(String type) {
    this.type = type;
  }

  public Timestamp getUpdate_time() {
    return update_time;
  }

  public void setUpdate_time(Timestamp update_time) {
    this.update_time = update_time;
  }
}
