package data.horizon.core.config.service.impl;

import data.horizon.analysis.*;
import data.horizon.core.config.dao.JobDetailDAO;
import data.horizon.core.config.model.Sqoop;
import data.horizon.core.config.service.JobDetailService;
import data.horizon.utils.JobDetailAndPluginUtil;
import data.horizon.utils.ConvertNameUtil;
import data.horizon.utils.SqlPreProcessUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * Created by huyang on 2016/3/17.
 */

@Service
public class JobDetailServiceImpl implements JobDetailService {

  @Resource
  private JobDetailDAO jobDetailDAO;

  @Override
  public List<Map<String, String>> get() {
    return null;
  }

  @Override
  public void add(Sqoop sqoop) throws Exception{
      List<String> sqls = SqlPreProcessUtil.preProcess(sqoop.getHive_command(),sqoop.getHive_db(),sqoop.getHive_table_name());
      Analysiser analysiser = AnalysiserFactory.build(ActionType.HIVESQL);
      Visitor visitor = VisitorFactory.build(ActionType.HIVESQL);
      for(String sql:sqls)
      {
        Plan plan = analysiser.analysis(sql);
        visitor.setDefaultDB(sqoop.getHive_db());
        plan.accept(visitor);
      }
      sqoop.setSource_db_names(ConvertNameUtil.convertShortNameToNormalName(sqoop.getSource_db_short_names()));
      jobDetailDAO.add(JobDetailAndPluginUtil.doSqoop2JobDetails(sqoop));
  }
}
