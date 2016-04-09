package data.horizon.core.config.service.impl;

import data.horizon.core.config.dao.DBConfigDAO;
import data.horizon.core.config.model.DBInfo;
import data.horizon.core.config.service.DBConfigService;
import data.horizon.utils.LocalCacheUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

/**
 * Created by huangshiqian on 15/10/28.
 */
@Service
public class DBConfigServiceImpl implements DBConfigService {
  private static Logger logger = LoggerFactory.getLogger(DBConfigServiceImpl.class);
  private static LocalCacheUtil cacheUtil = LocalCacheUtil.getInstance();

  @Resource
  private DBConfigDAO dbConfigDAO;
  private static final String CACHE_KEY = "DB_INFO_LIST";

  public DBConfigDAO getDbConfigDAO() {
    return dbConfigDAO;
  }

  public void setDbConfigDAO(DBConfigDAO dbConfigDAO) {
    this.dbConfigDAO = dbConfigDAO;
  }

  @Override
  public List<DBInfo> listDB() {
    List<DBInfo> dbInfoList = (List<DBInfo>) cacheUtil.get(CACHE_KEY);

    logger.debug("[listDB] DBInfo List In Cache == " + (dbInfoList != null));

    if(dbInfoList == null) {
      dbInfoList = dbConfigDAO.listDB();
      cacheUtil.put(CACHE_KEY, dbInfoList);
    }

//    if(dbInfoList != null) {
//      Collections.sort(dbInfoList);
//    }
//    dbInfoList.forEach(dbInfo -> System.out.println(dbInfo));

    return dbInfoList;
  }

  @Override
  public Object updateDBInfo(DBInfo dbInfo) {
    logger.debug("[updateDBInfo] Update DBInfo TO" + dbInfo);

    Object obj = dbConfigDAO.updateDBInfo(dbInfo);

    clearCache();

    return obj;
  }

  @Override
  public DBInfo updateDBStatus(int db_id) {
    logger.debug("[updateDBInfo] Update DBInfo TO" + db_id);

    dbConfigDAO.updateDBStatus(db_id);
    DBInfo dbInfo = dbConfigDAO.queryOne(db_id);

    clearCache();

    return dbInfo;
  }

  @Override
  public Object addDBInfo(DBInfo dbInfo) {
    logger.debug("[addDBInfo] Add DBInfo dbInfo ＝ " + dbInfo);

    Object obj = dbConfigDAO.addDBInfo(dbInfo);

    clearCache();

    return obj;
  }

  private void clearCache() {
    logger.debug("[clearCache] Clear Local DBInfo Cache, CacheKEY ＝ " + CACHE_KEY);
    cacheUtil.remove(CACHE_KEY);
  }
}
