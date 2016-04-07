package data.horizon.core.config.dao.impl;

import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.JobDetailDAO;
import data.horizon.core.config.model.JobDetail;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huyang on 2016/3/17.
 */
@Repository
public class JobDetailDAOImpl extends BaseDAO implements JobDetailDAO {

  @Resource
  private SqlSessionTemplate sqlSession;

  @Override
  public SqlSessionTemplate getSqlSession() {
    return sqlSession;
  }

  @Override
  public List<JobDetail> get() {
    return (List<JobDetail>)super.queryList("JobDetail.select",null);
  }

  @Override
  public void add(List<JobDetail> jobDetails) {
      super.save("JobDetail.insert",jobDetails);
  }
}
