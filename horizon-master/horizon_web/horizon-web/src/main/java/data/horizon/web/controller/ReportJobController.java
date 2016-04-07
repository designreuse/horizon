package data.horizon.web.controller;

import data.horizon.core.config.model.DBInfo;
import data.horizon.core.config.model.ReportJob;
import data.horizon.core.config.service.EtlMetaService;
import data.horizon.model.Result;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
 * Created by huangshiqian on 15/10/28.
 */
@Controller
@RequestMapping(
    value = "/job"
)
public class ReportJobController extends IndexController {
  private static Logger logger = LoggerFactory.getLogger(ReportJobController.class);

  @Resource
  private EtlMetaService etlMetaService;

  public EtlMetaService getEtlMetaService() {
    return etlMetaService;
  }

  public void setEtlMetaService(EtlMetaService etlMetaService) {
    this.etlMetaService = etlMetaService;
  }

  @RequestMapping(value = "/report", method = RequestMethod.GET)
  public ModelAndView reportList(HttpSession session, ModelMap model) {

    logger.info("list report job config");

    List<ReportJob> reportJobList = etlMetaService.reportJoblist();

    model.put("reportJobList", reportJobList);

    return moduleAndView1(session, model, "job", "report");
  }
}
