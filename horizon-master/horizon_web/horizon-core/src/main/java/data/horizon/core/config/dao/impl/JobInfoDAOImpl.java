package data.horizon.core.config.dao.impl;

import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.JobInfoDAO;
import data.horizon.core.config.model.JobInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huyang on 2016/2/29.
 */
@Repository
public class JobInfoDAOImpl extends BaseDAO implements JobInfoDAO {

  @Resource
  private SqlSessionTemplate sqlSession;

  @Override
  public List<JobInfo> getAll() {
    return (List<JobInfo>)super.queryList("JobInfo.list",null);
  }

  @Override
  public int add(JobInfo jobInfo) {
    super.save("JobInfo.insert", jobInfo);
    int id = jobInfo.getId();
    return id;
  }

  @Override
  public void update(JobInfo jobInfo) {
    super.update("JobInfo.update",jobInfo);
  }

  @Override
  public SqlSessionTemplate getSqlSession() {
    return this.sqlSession;
  }
}
