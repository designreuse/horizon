package data.horizon.core.config.model;

/**
 * Created by huangshiqian on 15/11/17.
 */
public class Column {
  private String column_name;
  private int type;
  private String comment;
  private long tbl_id;
  private String tbl_name;
  private int db_id;
  private String db_name;

  public String getColumn_name() {
    return column_name;
  }

  public void setColumn_name(String column_name) {
    this.column_name = column_name;
  }

  public String getComment() {
    return comment;
  }

  public void setComment(String comment) {
    this.comment = comment;
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

  public int getType() {
    return type;
  }

  public void setType(int type) {
    this.type = type;
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
}
