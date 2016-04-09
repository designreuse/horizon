package data.horizon.core.config.model;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.sql.Timestamp;

/**
 * Created by haolijs on 2016/3/31.
 */
public class BusinessProcess {
    private int business_process_id;
    private String business_process_name;
    private String business_process_details;
    private String business_charge_person;
    private String business_link;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp create_time;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp update_time;

    public int getBusiness_process_id() {
        return business_process_id;
    }

    public void setBusiness_process_id(int business_process_id) {
        this.business_process_id = business_process_id;
    }

    public String getBusiness_process_name() {
        return business_process_name;
    }

    public void setBusiness_process_name(String business_process_name) {
        this.business_process_name = business_process_name;
    }

    public String getBusiness_process_details() {
        return business_process_details;
    }

    public void setBusiness_process_details(String business_process_details) {
        this.business_process_details = business_process_details;
    }

    public String getBusiness_charge_person() {
        return business_charge_person;
    }

    public void setBusiness_charge_person(String business_charge_person) {
        this.business_charge_person = business_charge_person;
    }

    public String getBusiness_link() {
        return business_link;
    }

    public void setBusiness_link(String business_link) {
        this.business_link = business_link;
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


    public BusinessProcess(int business_process_id, String business_process_name, String business_process_details, String business_charge_person, String business_link, Timestamp create_time, Timestamp update_time) {
        this.business_process_id = business_process_id;
        this.business_process_name = business_process_name;
        this.business_process_details = business_process_details;
        this.business_charge_person = business_charge_person;
        this.business_link = business_link;
        this.create_time = create_time;
        this.update_time = update_time;
    }

    public BusinessProcess(){

    }


}
