package data.horizon.web.controller;

import data.horizon.core.config.model.ServerInfo;
import data.horizon.core.config.service.ServerConService;
import data.horizon.model.Result;
//import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.RequestContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by haolijs on 2016/3/16.
 */
@RestController
@RequestMapping(
      value= "/resource1"
)
public class ServerController extends IndexController {
    @Resource
    private ServerConService serverConService;

    @RequestMapping("/server_general")
    public ModelAndView list() {
        ModelAndView mav = new ModelAndView();
        List<ServerInfo> serverInfos = serverConService.list();
        mav.addObject("serverInfos", serverInfos);
        mav.addObject("module", "resource");
        mav.addObject("view", "server_general");
        mav.setViewName("resource/server_general");
        return mav;
    }

//    @RequestMapping("/server_add")
//    public String add(ServerInfo serverInfo) {
//        serverConService.add(serverInfo);
//        return "resource/server_general";
//    }

    @RequestMapping(value ="/server_add",method = RequestMethod.POST)
    public Result add(HttpSession session, HttpServletRequest request, ModelMap model, @ModelAttribute ServerInfo serverInfo) {
        Result result = new Result();
        RequestContext requestContext = new RequestContext(request);

        serverConService.add(serverInfo);

        result.setStatus(true);
        result.setCode("SUCCESS");
        result.setMsg(requestContext.getMessage("data.horizon.resource.server.message.add.success"));

        return result;
    }


//    @RequestMapping("/{id:\\d+}/update")
//    public String update(ServerInfo serverInfo) {
//        serverConService.update(serverInfo);
//        return "resource/server_general";
//    }

    @RequestMapping(value ="/{id:\\d+}/update", method = RequestMethod.POST)
    public Result update(HttpSession session, HttpServletRequest request, ModelMap model, @ModelAttribute ServerInfo serverInfo) {
        Result result = new Result();

        RequestContext requestContext = new RequestContext(request);

        serverConService.update(serverInfo);
        result.setStatus(true);
        result.setCode("SUCCESS");
        result.setMsg(requestContext.getMessage("data.horizon.resource.server.message.success"));
        return result;
    }



  //  @RequestMapping(value = "/server/{id:\\d+}/status_control" ,produces = "application/json;charset=UTF-8")
  @RequestMapping(value = "/server/{id:\\d+}/status_control")
    public ServerInfo dbStatus(@PathVariable(value="id") int server_id) {

      ServerInfo serverInfo =  serverConService.updateDBStatus(server_id);
       return serverInfo;
    }


    @RequestMapping(value = "/{id:\\d+}/delete")
    public Result delete(HttpSession session, HttpServletRequest request, ModelMap model, @PathVariable(value="id") int server_id){
        Result result = new Result();

        RequestContext requestContext = new RequestContext(request);

        serverConService.delete(server_id);
        result.setStatus(true);
        result.setCode("SUCCESS");
        result.setMsg(requestContext.getMessage("data.horizon.resource.server.message.del.success"));
        return result;
    }


}
