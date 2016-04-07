package data.horizon.core.config.dao;

import data.horizon.core.config.model.User;

import java.util.List;

/**
 * Created by huyang on 2016/3/29.
 */
public interface UserDAO {
  List<User> getAllUers();
  User getOneUser(String email);
  boolean addUser(User user);
}
