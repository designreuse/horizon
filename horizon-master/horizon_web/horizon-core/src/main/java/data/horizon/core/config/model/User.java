package data.horizon.core.config.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * Created by huyang on 2016/3/29.
 */
public class User {
  private int id;
  private String department;
  private String account;
  private String display_name;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp last_login_time;
  private String last_login_ip;
  private String email;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp create_time;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp update_time;
  private String is_enable;
  private String role_id;
  private String mobilephone;

  public User(){}

  public User(String email,String[] permissions){
    this.email = email;
    for(int i = 0; i < permissions.length; i++)
    {
      this.role_id += permissions[i] + ",";
    }
    this.role_id = this.role_id.substring(0,this.role_id.lastIndexOf(","));
  }

  public User(String email,String account,String display_name,String department) {
    this.email = email;
    this.account = account;
    this.display_name = display_name;
    this.department = department;
  }

  public int getId() {
    return id;
  }

  public void setId(int id) {
    this.id = id;
  }

  public String getDepartment() {
    return department;
  }

  public void setDepartment(String department) {
    this.department = department;
  }

  public String getAccount() {
    return account;
  }

  public void setAccount(String account) {
    this.account = account;
  }

  public String getDisplay_name() {
    return display_name;
  }

  public void setDisplay_name(String display_name) {
    this.display_name = display_name;
  }

  public Timestamp getLast_login_time() {
    return last_login_time;
  }

  public void setLast_login_time(Timestamp last_login_time) {
    this.last_login_time = last_login_time;
  }

  public String getLast_login_ip() {
    return last_login_ip;
  }

  public void setLast_login_ip(String last_login_ip) {
    this.last_login_ip = last_login_ip;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
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

  public String getIs_enable() {
    return is_enable;
  }

  public void setIs_enable(String is_enable) {
    this.is_enable = is_enable;
  }

  public String getRole_id() {
    return role_id;
  }

  public void setRole_id(String role_id) {
    this.role_id = role_id;
  }

  public String getMobilephone() {
    return mobilephone;
  }

  public void setMobilephone(String mobilephone) {
    this.mobilephone = mobilephone;
  }
}
