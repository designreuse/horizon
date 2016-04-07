package data.horizon.core.config.dao.impl;

import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.DWDAO;
import data.horizon.core.config.model.Column;
import data.horizon.core.config.model.DimensionModel;
import data.horizon.core.config.model.Table;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huangshiqian on 15/11/14.
 */
@Repository
public class DWDAOImpl extends BaseDAO implements DWDAO {
  @Resource
  private SqlSessionTemplate dwSqlSession;

  private static Logger logger = LoggerFactory.getLogger(DWDAOImpl.class);

  @Override
  public List<Table> listPhysicalTable() {
    return (List<Table>) super.queryList("data.horizon.core.config.dw.model.physical.query_tbl", null);
  }

  @Override
  public List<Column> listPhysicalColumn() {
    return (List<Column>) super.queryList("data.horizon.core.config.dw.model.physical.query_col", null);
  }

  @Override
  public SqlSessionTemplate getSqlSession() {
    return dwSqlSession;
  }
}
