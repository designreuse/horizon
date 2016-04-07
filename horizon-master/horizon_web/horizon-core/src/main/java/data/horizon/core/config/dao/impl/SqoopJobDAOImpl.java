package data.horizon.core.config.dao.impl;

import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.SqoopJobDAO;
import data.horizon.core.config.model.SqoopJob;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huyang on 2015/11/10.
 */
@Repository
public class SqoopJobDAOImpl extends BaseDAO implements SqoopJobDAO {

  @Resource
  private SqlSessionTemplate sqlSession;

  @Override
  public List<SqoopJob> list() {
    return (List<SqoopJob>) super.queryList("data.horizon.core.config.model.Sqoopjob.list", null);
  }

  @Override
  public void update(SqoopJob sqoopJob) {
    super.update("data.horizon.core.config.model.Sqoopjob.update", sqoopJob);
  }

  @Override
  public void insert(SqoopJob sqoopJob) {
    super.save("data.horizon.core.config.model.Sqoopjob.insert", sqoopJob);
  }

  @Override
  public SqlSessionTemplate getSqlSession() {
    return sqlSession;
  }
}
