package data.horizon.core.config.model;


import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * Created by huangshiqian on 15/11/17.
 */
public class Table {
  private long tbl_id;
  private String tbl_name;
  private String user;
  private String db_name;
  private String database_name;
  private int tbl_type;
  private String tbl_comment;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp create_time;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp update_time;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Timestamp ddl_update_time;

  public Timestamp getCreate_time() {
    return create_time;
  }

  public void setCreate_time(Timestamp create_time) {
    this.create_time = create_time;
  }

  public String getDatabase_name() {
    return database_name;
  }

  public void setDatabase_name(String database_name) {
    this.database_name = database_name;
  }

  public String getDb_name() {
    return db_name;
  }

  public void setDb_name(String db_name) {
    this.db_name = db_name;
  }

  public Timestamp getDdl_update_time() {
    return ddl_update_time;
  }

  public void setDdl_update_time(Timestamp ddl_update_time) {
    this.ddl_update_time = ddl_update_time;
  }

  public String getTbl_comment() {
    return tbl_comment;
  }

  public void setTbl_comment(String tbl_comment) {
    this.tbl_comment = tbl_comment;
  }

  public long getTbl_id() {
    return tbl_id;
  }

  public void setTbl_id(long tbl_id) {
    this.tbl_id = tbl_id;
  }

  public String getTbl_name() {
    return tbl_name;
  }

  public void setTbl_name(String tbl_name) {
    this.tbl_name = tbl_name;
  }

  public int getTbl_type() {
    return tbl_type;
  }

  public void setTbl_type(int tbl_type) {
    this.tbl_type = tbl_type;
  }

  public Timestamp getUpdate_time() {
    return update_time;
  }

  public void setUpdate_time(Timestamp update_time) {
    this.update_time = update_time;
  }

  public String getUser() {
    return user;
  }

  public void setUser(String user) {
    this.user = user;
  }
}
