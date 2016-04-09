package data.horizon.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

/**
 * Created by david on 9/20/15.
 */
@Controller
@RequestMapping("/account")
public class AccountController {

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login(HttpSession session) {
    //if(session.getAttribute("user") != null)
    //    return "redirect:/home";

    System.out.println("========== login =========== ");

    return "account/login";
  }

  @RequestMapping(value = "/widgets", method = RequestMethod.GET)
  public String widgets(HttpSession session) {
    //if(session.getAttribute("user") != null)
    //    return "redirect:/home";

    System.out.println("========== widgets =========== ");

    return "widgets";
  }
}
