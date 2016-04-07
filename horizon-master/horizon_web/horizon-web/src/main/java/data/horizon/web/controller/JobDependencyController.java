package data.horizon.web.controller;

import data.horizon.core.config.service.DependencyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * Created by huyang on 2016/1/13.
 */

@Controller
@RequestMapping("/dependency")
public class JobDependencyController {

  @Autowired
  @Qualifier("jobDependencyServiceImpl")
  DependencyService jobDependencyService;

  @RequestMapping("/alljobs")
  public String getAllJobDependencyGraph(Model model)
  {
    model.addAttribute("graph", jobDependencyService.getAllDependencyGraph()) ;
    return "dependency/jobdependency";
  }

  @RequestMapping("/job/*")
  public String getOneJobDependencyGraph(Model model)
  {
    return "";
  }
}
