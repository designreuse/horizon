package data.horizon.model;

import java.io.Serializable;

/**
 * Created by david on 9/22/15.
 */
public class Tag implements Serializable {
    private Integer id;
    private String tag;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }
}
