package data.horizon.web.controller;

import data.horizon.core.config.model.DBInfo;
import data.horizon.core.config.service.DBConfigService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by huangshiqian on 15/10/28.
 */
@Controller
@RequestMapping(
    value = "/resource"
)
public class DBController extends IndexController {
  private static Logger logger = LoggerFactory.getLogger(DBController.class);

  @Resource
  private DBConfigService dbConfigService;

  public DBConfigService getDbConfigService() {
    return dbConfigService;
  }

  public void setDbConfigService(DBConfigService dbConfigService) {
    this.dbConfigService = dbConfigService;
  }

  @RequestMapping(value = "/db_general", method = RequestMethod.GET)
  public ModelAndView dbConfig(HttpSession session, ModelMap model) {

    logger.info("list db config");

    List<DBInfo> dblist = dbConfigService.listDB();

    model.put("dbList", dblist);

    return moduleAndView1(session, model, "resource", "db_general");
  }

}
