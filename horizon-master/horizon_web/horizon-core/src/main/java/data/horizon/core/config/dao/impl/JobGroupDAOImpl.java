package data.horizon.core.config.dao.impl;

import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.JobGroupDAO;
import data.horizon.core.config.model.JobGroup;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huyang on 2016/2/29.
 */
@Repository
public class JobGroupDAOImpl extends BaseDAO implements JobGroupDAO {

  @Resource
  private SqlSessionTemplate sqlSession;

  @Override
  public List<JobGroup> getAll() {
    return (List<JobGroup>)super.queryList("JobGroup.list",null);
  }

  @Override
  public void add(JobGroup jobGroup) {
    super.save("JobGroup.insert",jobGroup);
  }

  @Override
  public void update(JobGroup jobGroup) {
    super.update("JobGroup.update",jobGroup);
  }

  @Override
  public SqlSessionTemplate getSqlSession() {
    return this.sqlSession;
  }
}
