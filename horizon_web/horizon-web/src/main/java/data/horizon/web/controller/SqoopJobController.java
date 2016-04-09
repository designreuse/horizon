package data.horizon.web.controller;

import data.horizon.core.config.model.SqoopJob;
import data.horizon.core.config.service.SqoopJobService;
import data.horizon.utils.ConvertName;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huyang on 2015/11/10.
 */

@Controller
@RequestMapping("/sqoop")
public class SqoopJobController extends IndexController{

    @Resource
    private SqoopJobService sqoopJobService;

    @Resource
    private ConvertName convertName;

    @RequestMapping("/list")
    public ModelAndView list()
    {
        ModelAndView mav = new ModelAndView();
        List<SqoopJob> sqoopJobs = sqoopJobService.list();
        mav.addObject("sqoopJobs", sqoopJobs);
        mav.addObject("module","job");
        mav.addObject("view","sqooplist");
        mav.setViewName("job/sqooplist");
        return mav;
    }

    @RequestMapping("/{id:\\d+}/update")
    public String update(SqoopJob sqoopJob)
    {
        sqoopJob.setSource_db_names(convertName.convertShortNameToNormalName(sqoopJob.getSource_db_short_names()));
        sqoopJobService.update(sqoopJob);
        return "job/sqooplist";
    }

    @RequestMapping("/add")
    public String add(SqoopJob sqoopJob)
    {
        sqoopJob.setSource_db_names(convertName.convertShortNameToNormalName(sqoopJob.getSource_db_short_names()));
        sqoopJobService.add(sqoopJob);
        return "job/sqooplist";
    }
}
