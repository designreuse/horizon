package data.horizon.web.controller;

import data.horizon.core.config.model.User;
import data.horizon.core.config.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by huyang on 2016/4/5.
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

  @Autowired
  private UserService userService;

  @RequestMapping(value = "/all")
  public ModelAndView list()
  {
    ModelAndView modelAndView = new ModelAndView();
    List<User> users = this.userService.getAllUers();
    modelAndView.addObject("users",users);
    modelAndView.setViewName("user/user");
    return modelAndView;
  }

  @RequestMapping(value = "/{email}")
  public ModelAndView getOne(String email)
  {
    return null;
  }

  @RequestMapping(value = "/add")
  public String add(String email,String[] permissions)
  {
    User user = new User(email,permissions);
    this.userService.addUser(user);
    return "user/user";
  }
}
