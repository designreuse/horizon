package data.horizon.core.config.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * Created by huyang on 2015/11/10.
 */
public class SqoopJob{
    private Integer sqp_job_id;
    private String sqp_job_name;
    private String source_db_names;
    private String source_db_short_names;
    private String hive_db;
    private String hive_table_name;
    private String sqp_command;
    private String hive_command;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp create_time;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp update_time;

    public SqoopJob() {
    }

    public SqoopJob(Integer sqp_job_id, String sqp_job_name, String source_db_names, String hive_db, String hive_table_name, String sqp_command, String hive_command, Timestamp create_time, Timestamp update_time) {
        this.sqp_job_id = sqp_job_id;
        this.sqp_job_name = sqp_job_name;
        this.source_db_names = source_db_names;
        this.hive_db = hive_db;
        this.hive_table_name = hive_table_name;
        this.sqp_command = sqp_command;
        this.hive_command = hive_command;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    public Integer getSqp_job_id() {
        return sqp_job_id;
    }

    public void setSqp_job_id(Integer sqp_job_id) {
        this.sqp_job_id = sqp_job_id;
    }

    public String getSqp_job_name() {
        return sqp_job_name;
    }

    public void setSqp_job_name(String sqp_job_name) {
        this.sqp_job_name = sqp_job_name;
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
