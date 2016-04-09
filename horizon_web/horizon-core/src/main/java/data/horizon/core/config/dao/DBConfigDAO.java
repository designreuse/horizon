package data.horizon.core.config.dao;

import data.horizon.core.config.model.DBInfo;

import java.util.List;

/**
 * Created by huangshiqian on 15/10/28.
 */
public interface DBConfigDAO {
  List<DBInfo> listDB();

  Object updateDBInfo(DBInfo dbInfo);

  Object updateDBStatus(int db_id);

  DBInfo queryOne(int db_id);

  Object addDBInfo(DBInfo dbInfo);
}
