package data.horizon.web.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * Created by david on 9/20/15.
 */
@Controller
public class IndexController {
  private static Logger logger = LoggerFactory.getLogger(IndexController.class);

  @RequestMapping(value = "/login", method = RequestMethod.GET)
  public String login(HttpSession session) {
    //if(session.getAttribute("user") != null)
    //    return "redirect:/home";

    System.out.println("========== login =========== ");

    return "account/login";
  }

  @RequestMapping(value = "/{module}", method = RequestMethod.GET)
  public String module(HttpSession session, ModelMap model, @PathVariable(value = "module") String module) {
    model.put("module", module);

    logger.debug("[moduleAndView1] redirect to view : " + module);

    return module;
  }

  @RequestMapping(value = "/{module}/{view}.html", method = RequestMethod.GET)
  public ModelAndView moduleAndView1(HttpSession session, ModelMap model
      , @PathVariable(value = "module") String module
      , @PathVariable(value = "view") String view) {
    logger.debug("[moduleAndView1] redirect to view : " + module + "&" + view);

    ModelAndView viewModel = new ModelAndView(module + "/" + view);
    viewModel.setViewName(module + "/" + view);

    model.put("module", module);
    model.put("view", view);

    return viewModel;
  }
}
