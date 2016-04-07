package data.horizon.core.config.dao.impl;

import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.UserDAO;
import data.horizon.core.config.model.User;
import data.horizon.utils.UserLDAPUtil;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by huyang on 2016/3/29.
 */
@Repository
public class UserDAOImpl extends BaseDAO implements UserDAO{

  @Autowired
  private SqlSessionTemplate sqlSession;

  @Override
  public List<User> getAllUers() {
    return (List<User>)super.queryList("User.getAllUers",null);
  }

  @Override
  public User getOneUser(String email) {
    User user = null;
    try {
      user = (User)super.queryOne("User.getOneUser", email);
      if(user == null) {
        user = UserLDAPUtil.getOneUser(email);
      }
    }catch (Exception e) {
      e.printStackTrace();
    }
    return user;
  }

  @Override
  public boolean addUser(User user) {
    super.save("User.addUser",user);
    return true;
  }

  @Override
  public SqlSessionTemplate getSqlSession() {
    return sqlSession;
  }
}
