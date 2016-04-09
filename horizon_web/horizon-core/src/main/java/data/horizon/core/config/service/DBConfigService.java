package data.horizon.core.config.service;

import data.horizon.core.config.model.DBInfo;

import java.util.List;

/**
 * Created by huangshiqian on 15/10/28.
 */
public interface DBConfigService {
  List<DBInfo> listDB();

  Object updateDBInfo(DBInfo dbInfo);

  DBInfo updateDBStatus(int db_id);

  Object addDBInfo(DBInfo dbInfo);
}
