package data.horizon.core.config.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * Created by huangshiqian on 15/11/24.
 */
public class ReportJob {
  private int id;
  private String name;
  private String report_name;
  private String location_path;
  private int send_type;
  private String manager;
  private int status;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp create_time;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp update_time;

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getLocation_path() {
    return location_path;
  }

  public void setLocation_path(String location_path) {
    this.location_path = location_path;
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

  public String getReport_name() {
    return report_name;
  }

  public void setReport_name(String report_name) {
    this.report_name = report_name;
  }

  public int getSend_type() {
    return send_type;
  }

  public void setSend_type(int send_type) {
    this.send_type = send_type;
  }

  public int getStatus() {
    return status;
  }

  public void setStatus(int status) {
    this.status = status;
  }

  public Timestamp getCreate_time() {
    return create_time;
  }

  public void setCreate_time(Timestamp create_time) {
    this.create_time = create_time;
  }

  public Timestamp getUpdate_time() {
    return update_time;
  }

  public void setUpdate_time(Timestamp update_time) {
    this.update_time = update_time;
  }
}
