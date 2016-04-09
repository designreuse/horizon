package data.horizon.core.config.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * Created by huangshiqian on 15/10/28.
 */
public class DBInfo implements Comparable<DBInfo> {
  private int db_id;
  private String db_name;
  private String database_name;
  private String db_desc;
  private String db_url;
  private String dialect;
  private String user_name;
  private String pwd;
  private short is_enable;
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

  public String getDb_desc() {
    return db_desc;
  }

  public void setDb_desc(String db_desc) {
    this.db_desc = db_desc;
  }

  public int getDb_id() {
    return db_id;
  }

  public void setDb_id(int db_id) {
    this.db_id = db_id;
  }

  public String getDb_name() {
    return db_name;
  }

  public void setDb_name(String db_name) {
    this.db_name = db_name;
  }

  public String getDatabase_name() {
    return database_name;
  }

  public void setDatabase_name(String database_name) {
    this.database_name = database_name;
  }

  public String getDb_url() {
    return db_url;
  }

  public void setDb_url(String db_url) {
    this.db_url = db_url;
  }

  public String getDialect() {
    return dialect;
  }

  public void setDialect(String dialect) {
    this.dialect = dialect;
  }

  public short getIs_enable() {
    return is_enable;
  }

  public void setIs_enable(short is_enable) {
    this.is_enable = is_enable;
  }

  public String getUser_name() {
    return user_name;
  }

  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }

  public String getPwd() {
    return pwd;
  }

  public void setPwd(String pwd) {
    this.pwd = pwd;
  }

  public Timestamp getUpdate_time() {
    return update_time;
  }

  public void setUpdate_time(Timestamp update_time) {
    this.update_time = update_time;
  }

  @Override
  public int compareTo(DBInfo o) {
    return o.update_time.compareTo(this.update_time);
  }

  @Override
  public String toString() {
    return "DBInfo{" +
        "create_time=" + create_time +
        ", db_id=" + db_id +
        ", db_name='" + db_name + '\'' +
        ", db_desc='" + db_desc + '\'' +
        ", db_url='" + db_url + '\'' +
        ", dialect='" + dialect + '\'' +
        ", pwd='" + pwd + '\'' +
        ", is_enable=" + is_enable +
        ", update_time=" + update_time +
        '}';
  }
}
