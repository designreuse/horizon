package data.horizon.core.config.dao.impl;

import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.DBConfigDAO;
import data.horizon.core.config.model.DBInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huangshiqian on 15/10/28.
 */
@Repository
public class DBConfigDAOImpl extends BaseDAO implements DBConfigDAO{
  @Resource
  private SqlSessionTemplate sqlSession;

  private static Logger logger = LoggerFactory.getLogger(DBConfigDAOImpl.class);

  @Override
  public List<DBInfo> listDB() {
    logger.debug("SEARCH DBInfo FROM DB");

    return (List<DBInfo>) super.queryList("data.horizon.core.config.db.query_all", null);
  }

  @Override
  public Object updateDBInfo(DBInfo dbInfo) {
    return super.update("data.horizon.core.config.db.update", dbInfo);
  }

  @Override
  public Object updateDBStatus(int db_id) {
    return super.update("data.horizon.core.config.db.update_status", db_id);
  }

  @Override
  public DBInfo queryOne(int db_id) {
    return (DBInfo) super.queryOne("data.horizon.core.config.db.query", db_id);
  }

  @Override
  public Object addDBInfo(DBInfo dbInfo) {
    return super.save("data.horizon.core.config.db.save", dbInfo);
  }

  @Override
  public SqlSessionTemplate getSqlSession() {
    return sqlSession;
  }
}
