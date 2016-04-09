package data.horizon.web.controller;

import data.horizon.core.config.model.BusinessProcess;
import data.horizon.core.config.service.BusinessProcessService;
import data.horizon.model.Result;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
/**
 * Created by haolijs on 2016/4/1.
 */


@RestController
@RequestMapping(
        value= "/dw_model_new"
)
public class BusinessProcessController extends IndexController {
    @Resource
    private BusinessProcessService businessProcessService;

    @RequestMapping("/business_process")

    public ModelAndView list(){
        ModelAndView mav=new ModelAndView();
        List<BusinessProcess> businessProcessList=businessProcessService.list();
        mav.addObject("businessProcessList",businessProcessList);
        mav.addObject("module", "dw_model");
        mav.addObject("view","business_process");
        mav.setViewName("dw_model/business_process");
        return mav;
    }

    @RequestMapping("/business_process_add")

    public Result add(HttpSession session, HttpServletRequest request, ModelMap model, @ModelAttribute BusinessProcess businessProcess)
    {
        Result result=new Result();
        RequestContext requestContext=new RequestContext(request);

        businessProcessService.add(businessProcess);

        result.setStatus(true);
        result.setCode("SUCCESS");
        result.setMsg(requestContext.getMessage("data.horizon.resource.server.message.add.success"));

        return result;

    }

    @RequestMapping(value ="/{id:\\d+}/update", method = RequestMethod.POST)

    public Result update(HttpSession session, HttpServletRequest request, ModelMap model, @ModelAttribute BusinessProcess businessProcess)
    {
        Result result = new Result();

        RequestContext requestContext = new RequestContext(request);

        businessProcessService.update(businessProcess);

        result.setStatus(true);
        result.setCode("SUCCESS");
        result.setMsg(requestContext.getMessage("data.horizon.resource.server.message.success"));
        return result;
    }

   @RequestMapping(value = "/{id:\\d+}/delete")

    public  Result delete(HttpSession session, HttpServletRequest request, ModelMap model, @PathVariable(value="id") int business_process_id)
   {
       Result result = new Result();

       RequestContext requestContext = new RequestContext(request);

       businessProcessService.delete(business_process_id);

       result.setStatus(true);
       result.setCode("SUCCESS");
       result.setMsg(requestContext.getMessage("data.horizon.resource.server.message.del.success"));
       return result;


   }


}
