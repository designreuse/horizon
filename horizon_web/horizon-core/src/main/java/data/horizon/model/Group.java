package data.horizon.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by david on 9/20/15.
 */
public class Group implements Serializable {
    private Integer id;
    private String name;
    private Boolean pub;
    private List<Person> members;

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

    public List<Person> getMembers() {
        return members;
    }

    public void setMembers(List<Person> members) {
        this.members = members;
    }

    public Boolean getPub() {
        return pub;
    }

    public void setPub(Boolean pub) {
        this.pub = pub;
    }
}
