package data.horizon.web.controller;

import data.horizon.core.config.model.JobGroup;
import data.horizon.core.config.service.JobGroupService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by huyang on 2016/2/26.
 */
@Controller
@RequestMapping("/jobgroup")
public class JobGroupController {

  @Resource
  private JobGroupService jobGroupService;

  @RequestMapping("/list")
  public ModelAndView list()
  {
    ModelAndView mav = new ModelAndView();
    mav.addObject("jobgroups",jobGroupService.getAll());
    mav.setViewName("job/jobgroup");
    return mav;
  }

  @RequestMapping("/{id:\\d+}/update")
  public String update(JobGroup jobGroup)
  {
    jobGroupService.update(jobGroup);
    return "job/jobgroup";
  }

  @RequestMapping("/add")
  public String add(JobGroup jobGroup)
  {
    jobGroupService.add(jobGroup);
    return "job/jobgroup";
  }
}
