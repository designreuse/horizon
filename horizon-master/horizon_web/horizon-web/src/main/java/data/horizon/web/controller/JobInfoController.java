package data.horizon.web.controller;

import data.horizon.core.config.model.JobInfo;
import data.horizon.core.config.model.Sqoop;
import data.horizon.core.config.service.JobDetailService;
import data.horizon.core.config.service.JobInfoService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * Created by huyang on 2016/2/29.
 */
@Controller
@RequestMapping("/jobinfo")
public class JobInfoController {

  @Resource
  private JobInfoService jobInfoService;

  @Resource
  private JobDetailService jobDetailService;


  @RequestMapping("/list")
  public ModelAndView list()
  {
    ModelAndView mav = new ModelAndView();
    mav.addObject("jobinfos", jobInfoService.getAll());
    mav.setViewName("job/jobinfo");
    return mav;
  }

  @RequestMapping("/add")
  public String add()
  {
    return "job/addjobinfo";
  }

  @RequestMapping("/{id:\\d+}/update")
  public String update(JobInfo jobInfo)
  {
    jobInfoService.update(jobInfo);
    return "job/jobinfo";
  }

  @RequestMapping("/save/0")
  public String save0(JobInfo jobInfo)
  {
    jobInfoService.add(jobInfo);
    return "empty" ;
  }

  @RequestMapping("/save/1")
  public String save1(JobInfo jobInfo,Sqoop sqoop) throws Exception
  {
    int id = jobInfoService.add(jobInfo);
    sqoop.setJob_id(id);
    jobDetailService.add(sqoop);
    return "empty" ;
  }
}
