package data.horizon.core.config.dao.impl;

import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.EtlMetaDAO;
import data.horizon.core.config.model.ReportJob;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huangshiqian on 15/11/24.
 */
@Repository
public class EtlMetaDAOImpl extends BaseDAO implements EtlMetaDAO {
  @Resource
  private SqlSessionTemplate sqlSession;

  private static Logger logger = LoggerFactory.getLogger(EtlMetaDAOImpl.class);

  @Override
  public List<ReportJob> listReportJobs() {
    return (List<ReportJob>) super.queryList("data.horizon.core.config.etl.meta.job.report.query_all", null);
  }

  @Override
  public SqlSessionTemplate getSqlSession() {
    return sqlSession;
  }
}
