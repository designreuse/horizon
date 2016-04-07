package data.horizon.core.config.model;

/**
 * Created by huyang on 2016/3/15.
 */
public class Sqoop {
  private int job_id;
  private int plugin;
  private String source_db_names;
  private String source_db_short_names;
  private String hive_db;
  private String hive_table_name;
  private String sqp_command;
  private String hive_command;

  public int getJob_id() {
    return job_id;
  }

  public void setJob_id(int job_id) {
    this.job_id = job_id;
  }

  public int getPlugin() {
    return plugin;
  }

  public void setPlugin(int plugin) {
    this.plugin = plugin;
  }

  public String getSource_db_names() {
    return source_db_names;
  }

  public void setSource_db_names(String source_db_names) {
    this.source_db_names = source_db_names;
  }

  public String getSource_db_short_names() {
    return source_db_short_names;
  }

  public void setSource_db_short_names(String source_db_short_names) {
    this.source_db_short_names = source_db_short_names;
  }

  public String getHive_db() {
    return hive_db;
  }

  public void setHive_db(String hive_db) {
    this.hive_db = hive_db;
  }

  public String getHive_table_name() {
    return hive_table_name;
  }

  public void setHive_table_name(String hive_table_name) {
    this.hive_table_name = hive_table_name;
  }

  public String getSqp_command() {
    return sqp_command;
  }

  public void setSqp_command(String sqp_command) {
    this.sqp_command = sqp_command;
  }

  public String getHive_command() {
    return hive_command;
  }

  public void setHive_command(String hive_command) {
    this.hive_command = hive_command;
  }
}
