package data.horizon.web.controller;

import data.horizon.core.config.model.Column;
import data.horizon.core.config.model.DimensionModel;
import data.horizon.core.config.model.Table;
import data.horizon.core.config.service.DWService;
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
    value = "/dw_model"
)
public class DWController extends IndexController {
  private static Logger logger = LoggerFactory.getLogger(DWController.class);

  @Resource
  private DWService dwService;

  public DWService getDwService() {
    return dwService;
  }

  public void setDwService(DWService dwService) {
    this.dwService = dwService;
  }

  @RequestMapping(value = "/physical_tbl", method = RequestMethod.GET)
  public ModelAndView physicalTbl(HttpSession session, ModelMap model, boolean refresh) {

    logger.info("list physical table model");

    List<Table> tableList = dwService.listPhysicalTable(refresh);

    model.put("tableList", tableList);

    return moduleAndView1(session, model, "dw_model", "physical_tbl");
  }

  @RequestMapping(value = "/physical_tbl", method = RequestMethod.POST)
  public ModelAndView physicalTblRefresh(HttpSession session, ModelMap model) {
    return physicalTbl(session, model, true);
  }

  @RequestMapping(value = "/physical_col", method = RequestMethod.GET)
  public ModelAndView physicalCol(HttpSession session, ModelMap model, boolean refresh) {

    logger.info("list physical column model");

    List<Column> columnList = dwService.listPhysicalColumn(refresh);

    model.put("columnList", columnList);

    return moduleAndView1(session, model, "dw_model", "physical_col");
  }

  @RequestMapping(value = "/physical_col", method = RequestMethod.POST)
  public ModelAndView physicalColRefresh(HttpSession session, ModelMap model) {
    return physicalCol(session, model, true);
  }
}
