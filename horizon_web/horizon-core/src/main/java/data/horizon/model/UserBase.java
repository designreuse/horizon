package data.horizon.model;

import java.io.Serializable;

public class UserBase implements Serializable {
  private long ID;
  private String name;

  public long getID() {
    return ID;
  }

  public void setID(long iD) {
    ID = iD;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

}
