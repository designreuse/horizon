/*
 * @(#)UserController.java   15/09/25
 *
 * Copyright (c) 2005 im.mate
 *
 * License agreement text here ...
 *
 *
 *
 */

package data.horizon.web.controller;

import data.horizon.model.ResultModel;
import data.horizon.model.UserBase;

import org.springframework.web.bind.annotation.*;

import java.util.Date;

/**
 * @Description 用于测试spring-mvc resetful
 *
 * @version 1.0, 15/09/25
 * @author  huangshiqian
 */
@RestController
@RequestMapping(
  value = "/user",
  produces = "application/json;charset=UTF-8"
)
public class UserController {

  /**
   * @Description 测试spring mvc自动object－json转换和GET请求
   *
   * @return ResultModel
   */
  @RequestMapping(
    value = "/check",
    method = RequestMethod.GET
  )
  public ResultModel checkUnique() {
    ResultModel model = new ResultModel();

    System.out.println("test");
    model.setMsg("该账号可用！" + new Date().toString());

    return model;
  }

  /**
   * @Description 测试spring mvc自动object－json转换和POST请求
   *
   * @return UserBase
   */
  @RequestMapping(
    value = "/test",
    method = RequestMethod.POST
  )
  public UserBase test() {
    UserBase u = new UserBase();

    u.setID(100);
    u.setName("Test");

    return u;
  }

  /**
   * @Description 测试spring mvc正常字符串返回和POST请求
   *
   * @return String
   */
  @RequestMapping(
    value = "/ttt",
    method = RequestMethod.GET
  )
  public String ttt() {
    return "TTT";
  }

  /**
   * @Description 测试spring mvc异常监控和GET请求
   *
   * @param msg String
   * @param user_id Long
   *
   * @return String
   */
  @RequestMapping(
    value = "/say/{msg}/{user_id:\\d+}",
    method = RequestMethod.GET
  )
  public @ResponseBody
  String say(@PathVariable(value = "msg") String msg,
             @PathVariable(value = "user_id") Long user_id) {
    if (true) {
      throw new IndexOutOfBoundsException();
    }

    return "{\"msg\":\"you say:'" + msg + "' to " + user_id + "\"}";
  }

  /**
   * @Description 测试spring mvc请求格式POST,Resetful POST对应到注册功能
   *
   * @param user_id String
   *
   * @return String
   */
  @RequestMapping(
    value = "/{user_id}",
    method = RequestMethod.POST
  )
  public @ResponseBody
  String register(@PathVariable(value = "user_id") String user_id) {
    return "REGISTER USER ID = " + user_id;
  }

  /**
   * @Description 测试spring mvc请求格式DELETE,Resetful DELETE对应到删除功能
   *
   * @param user_id String
   *
   * @return String
   */
  @RequestMapping(
    value = "/{user_id}",
    method = RequestMethod.DELETE
  )
  public @ResponseBody
  String delete(@PathVariable(value = "user_id") String user_id) {
    return "DELETE USER ID = " + user_id;
  }

  /**
   * @Description 测试spring mvc请求格式PUT,Resetful PUT对应到更新功能
   *
   * @param user_id String
   *
   * @return String
   */
  @RequestMapping(
    value = "/{user_id}",
    method = RequestMethod.PUT
  )
  public @ResponseBody
  String update(@PathVariable(value = "user_id") String user_id) {
    return "UPDATE USER ID = " + user_id;
  }

  /**
   * @Description 测试spring mvc请求格式GET,Resetful GET对应到登录功能
   *
   * @param user_id String
   *
   * @return String
   */
  @RequestMapping(
    value = "/{user_id:\\d+}",
    method = RequestMethod.GET
  )
  public @ResponseBody
  String Login(@PathVariable(value = "user_id") String user_id) {
    return "REGISTER USER ID = " + user_id;
  }
}


//~ Formatted by Jindent --- http://www.jindent.com
