package data.horizon.model;

import java.io.Serializable;
import java.util.List;

/**
 * Created by david on 9/20/15.
 */
public class Activity implements Serializable {
    private Integer id;
    private Integer groupID;
    private String title;
    private String content;
    private Boolean memeberOnly;
    private List<Person> attendees;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getGroupID() {
        return groupID;
    }

    public void setGroupID(Integer groupID) {
        this.groupID = groupID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Boolean getMemeberOnly() {
        return memeberOnly;
    }

    public void setMemeberOnly(Boolean memeberOnly) {
        this.memeberOnly = memeberOnly;
    }

    public List<Person> getAttendees() {
        return attendees;
    }

    public void setAttendees(List<Person> attendees) {
        this.attendees = attendees;
    }
}
