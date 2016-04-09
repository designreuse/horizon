package data.horizon.model;

import java.io.Serializable;

/**
 * Created by david on 9/20/15.
 */
public class Person implements Serializable {
    private Integer id;
    private String name;
    private String avatar;
    private Integer gender;
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public Integer getGender() {
        return gender;
    }

    public void setGender(Integer gender) {
        this.gender = gender;
    }
}
