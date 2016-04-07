package data.horizon.core.config.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * Created by huyang on 2016/2/29.
 */
public class JobInfo {
  private int id;
  private String group_name;
  private String name;
  private String manager;
  private String running_status;
  private int plugin;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp start_time;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp end_time;
  private String frequency;
  private String enable;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp last_modified_time;
  private String desc;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getGroup_name() {
    return group_name;
  }

  public void setGroup_name(String group_name) {
    this.group_name = group_name;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getManager() {
    return manager;
  }

  public void setManager(String manager) {
    this.manager = manager;
  }

  public String getRunning_status() {
    return running_status;
  }

  public void setRunning_status(String running_status) {
    this.running_status = running_status;
  }

  public int getPlugin() {
    return plugin;
  }

  public void setPlugin(int plugin) {
    this.plugin = plugin;
  }

  public Timestamp getStart_time() {
    return start_time;
  }

  public void setStart_time(Timestamp start_time) {
    this.start_time = start_time;
  }

  public Timestamp getEnd_time() {
    return end_time;
  }

  public void setEnd_time(Timestamp end_time) {
    this.end_time = end_time;
  }

  public String getFrequency() {
    return frequency;
  }

  public void setFrequency(String frequency) {
    this.frequency = frequency;
  }

  public String getEnable() {
    return enable;
  }

  public void setEnable(String enable) {
    this.enable = enable;
  }

  public Timestamp getLast_modified_time() {
    return last_modified_time;
  }

  public void setLast_modified_time(Timestamp last_modified_time) {
    this.last_modified_time = last_modified_time;
  }

  public String getDesc() {
    return desc;
  }

  public void setDesc(String desc) {
    this.desc = desc;
  }
}
