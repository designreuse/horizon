package data.horizon.core.config.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;
/**
 * Created by haolijs on 2016/3/16.
 */
public class ServerInfo {

    private int server_id;
    private String server_name;
    private String server_ip;
    private String server_port;
    private String  server_desc;
    private int is_enable;
    private String user_name;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp create_time;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp update_time;
    private int max_run_script;
    private String group_name;
    private String belong_people;

    public ServerInfo(){

    }
//    public ServerInfo(int server_id, String server_name, String server_ip, String server_port, String server_desc, int is_enable, String user_name, Timestamp create_time, Timestamp update_time) {
//        this.server_id = server_id;
//        this.server_name = server_name;
//        this.server_ip = server_ip;
//        this.server_port = server_port;
//        this.server_desc = server_desc;
//        this.is_enable = is_enable;
//        this.user_name = user_name;
//        this.create_time = create_time;
//        this.update_time = update_time;
//        this.max_run_script = max_run_script;
//        this.group_name = group_name;
//        this.belong_people = belong_people;
//    }


    public ServerInfo(int server_id, String server_name, String server_ip, String server_port, String server_desc, int is_enable, String user_name, Timestamp create_time, Timestamp update_time, int max_run_script, String group_name, String belong_people) {
        this.server_id = server_id;
        this.server_name = server_name;
        this.server_ip = server_ip;
        this.server_port = server_port;
        this.server_desc = server_desc;
        this.is_enable = is_enable;
        this.user_name = user_name;
        this.create_time = create_time;
        this.update_time = update_time;
        this.max_run_script = max_run_script;
        this.group_name = group_name;
        this.belong_people = belong_people;
    }

    public int getServer_id() {
        return server_id;
    }

    public void setServer_id(int server_id) {
        this.server_id = server_id;
    }

    public String getServer_name() {
        return server_name;
    }

    public void setServer_name(String server_name) {
        this.server_name = server_name;
    }

    public String getServer_ip() {
        return server_ip;
    }

    public void setServer_ip(String server_ip) {
        this.server_ip = server_ip;
    }

    public String getServer_port() {
        return server_port;
    }

    public void setServer_port(String server_port) {
        this.server_port = server_port;
    }

    public String getServer_desc() {
        return server_desc;
    }

    public void setServer_desc(String server_desc) {
        this.server_desc = server_desc;
    }

    public int getIs_enable() {
        return is_enable;
    }

    public void setIs_enable(int is_enable) {
        this.is_enable = is_enable;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
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

    public int getMax_run_script() {
        return max_run_script;
    }

    public String getGroup_name() {
        return group_name;
    }

    public String getBelong_people() {
        return belong_people;
    }

    public void setMax_run_script(int max_run_script) {
        this.max_run_script = max_run_script;
    }

    public void setGroup_name(String group_name) {
        this.group_name = group_name;
    }

    public void setBelong_people(String belong_people) {
        this.belong_people = belong_people;
    }
}
