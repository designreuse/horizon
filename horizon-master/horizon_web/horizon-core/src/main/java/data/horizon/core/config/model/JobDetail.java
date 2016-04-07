package data.horizon.core.config.model;

/**
 * Created by huyang on 2016/3/16.
 */
public class JobDetail{
   private int job_id;
   private int plugin_id ;
   private String name;
   private Object value;

  public JobDetail() {
  }

  public JobDetail(int job_id, int plugin_id, String name, Object value) {
    this.job_id = job_id;
    this.plugin_id = plugin_id;
    this.name = name;
    this.value = value;
  }

  public int getJob_id() {
    return job_id;
  }

  public void setJob_id(int job_id) {
    this.job_id = job_id;
  }

  public int getPlugin_id() {
    return plugin_id;
  }

  public void setPlugin_id(int plugin_id) {
    this.plugin_id = plugin_id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Object getValue() {
    return value;
  }

  public void setValue(Object value) {
    this.value = value;
  }
}
