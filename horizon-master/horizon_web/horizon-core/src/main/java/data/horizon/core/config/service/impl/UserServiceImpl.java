package data.horizon.core.config.service.impl;

import data.horizon.core.config.dao.UserDAO;
import data.horizon.core.config.model.User;
import data.horizon.core.config.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by huyang on 2016/4/5.
 */
@Service
public class UserServiceImpl implements UserService {

  @Autowired
  private UserDAO userDAO;

  @Override
  public List<User> getAllUers() {
    return this.userDAO.getAllUers();
  }

  @Override
  public User getOneUser(String email) {
    return this.userDAO.getOneUser(email);
  }

  @Override
  public void addUser(User user) {
    User user1 = this.userDAO.getOneUser(user.getEmail());
    //LDAP中不存在此用户
    if(user1 == null){
      System.out.println("user not exists");
    }else {
      if(user1.getId() == 0){         //LDAP中存在，本地数据库中不存在此用户
        this.userDAO.addUser(user1);
      }else if(user1.getId() > 100){  //本地数据库中存在此用户
        System.out.println("user already exists");
      }
    }
  }
}
