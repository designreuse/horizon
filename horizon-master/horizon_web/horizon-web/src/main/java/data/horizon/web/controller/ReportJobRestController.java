package data.horizon.web.controller;

import data.horizon.core.config.model.DBInfo;
import data.horizon.core.config.model.ReportJob;
import data.horizon.core.config.service.EtlMetaService;
import data.horizon.model.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * Created by huangshiqian on 15/10/28.
 */
@RestController
@RequestMapping(
    value = "/job",
    produces = "application/json;charset=UTF-8"
)
public class ReportJobRestController extends IndexController {
  private static Logger logger = LoggerFactory.getLogger(ReportJobRestController.class);

  @Resource
  private EtlMetaService etlMetaService;

  public EtlMetaService getEtlMetaService() {
    return etlMetaService;
  }

  public void setEtlMetaService(EtlMetaService etlMetaService) {
    this.etlMetaService = etlMetaService;
  }

  /**
   * 添加数据库配置
   * @param session
   * @param model
   * @param dbInfo 前台传入的dbInfo属性自动组装的对象
   * @return 操作结果对象,自动转换为json
   */
  @RequestMapping(value = "/report1", method = RequestMethod.POST)
  public Result add(HttpSession session, HttpServletRequest request, ModelMap model, @ModelAttribute DBInfo dbInfo) {
    Result result = new Result();

    RequestContext requestContext = new RequestContext(request);

    logger.info("add db info " + dbInfo);

    // 判断参数是否合法
    if(dbInfo == null || StringUtils.isEmpty(dbInfo.getDb_name())
        || StringUtils.isEmpty(dbInfo.getDb_url())
        || StringUtils.isEmpty(dbInfo.getDialect())
        || StringUtils.isEmpty(dbInfo.getDb_desc())
        || StringUtils.isEmpty(dbInfo.getUser_name())
        || StringUtils.isEmpty(dbInfo.getPwd())
        || StringUtils.isEmpty(dbInfo.getDb_name())) {
      result.setCode("ERROR");
      result.setMsg(requestContext.getMessage("data.horizon.resource.db.message.empty"));
    } else {
      // 添加数据库

      result.setStatus(true);
      result.setCode("SUCCESS");
      result.setMsg(requestContext.getMessage("data.horizon.resource.db.message.add.success"));
    }

    return result;
  }

  /**
   * 更新数据库配置
   * @param session
   * @param model
   * @param dbInfo 前台传入的dbInfo属性自动组装的对象
   * @return 操作结果对象,自动转换为json
   */
  @RequestMapping(value = "/db/{id:\\d+}/edit", method = RequestMethod.POST)
  public Result dbEdit(HttpSession session, HttpServletRequest request, ModelMap model, @ModelAttribute DBInfo dbInfo) {
    Result result = new Result();

    RequestContext requestContext = new RequestContext(request);

    logger.info("edit db info " + dbInfo);

    // 判断参数是否合法
    if(dbInfo == null || dbInfo.getDb_id() < 1) {
      result.setCode("ERROR");
      result.setMsg(requestContext.getMessage("data.horizon.resource.db.message.invalid.id"));
    } else {
      // 更新数据库

      result.setStatus(true);
      result.setCode("SUCCESS");
      result.setMsg(requestContext.getMessage("data.horizon.resource.db.message.success"));
    }

    return result;
  }

  /**
   * 切换DB状态(启用/禁用)
   * @param session
   * @param model
   * @param db_id
   * @return 操作结果
   */
  @RequestMapping(value = "/db/{id:\\d+}/status_control", method = RequestMethod.POST)
  public DBInfo dbStatus(HttpSession session, HttpServletRequest request, ModelMap model, @PathVariable(value="id") int db_id) {
    Result result = new Result();

    RequestContext requestContext = new RequestContext(request);

    DBInfo dbInfo = null;
    logger.info("change db status db = " + db_id);

    // 判断参数是否合法
    if(db_id < 1) {
      result.setStatus(false);
      result.setCode("ERROR");
      result.setMsg(requestContext.getMessage("data.horizon.resource.db.message.invalid.id"));
    } else {
      // 更新数据库

      result.setStatus(true);
      result.setCode("SUCCESS");
      result.setMsg(requestContext.getMessage("data.horizon.resource.db.message.success"));
    }

    return dbInfo;
  }
}
