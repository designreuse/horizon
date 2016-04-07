package data.horizon.core.config.service;

import data.horizon.core.config.model.User;

import java.util.List;

/**
 * Created by huyang on 2016/3/29.
 */
public interface UserService {
  List<User> getAllUers();
  User getOneUser(String email);
  void addUser(User user);
 }
