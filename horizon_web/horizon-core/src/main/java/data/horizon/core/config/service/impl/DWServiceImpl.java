package data.horizon.core.config.service.impl;

import data.horizon.core.config.dao.DWDAO;
import data.horizon.core.config.model.Column;
import data.horizon.core.config.model.DimensionModel;
import data.horizon.core.config.model.Table;
import data.horizon.core.config.service.DWService;
import data.horizon.utils.LocalCacheUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huangshiqian on 15/11/14.
 */
@Service
public class DWServiceImpl implements DWService {
  private static Logger logger = LoggerFactory.getLogger(DWServiceImpl.class);
  private static LocalCacheUtil cacheUtil = LocalCacheUtil.getInstance();
  private static final String TABLE_CACHE_KEY = "DW_MODEL_TABLE";
  private static final String COLUMN_CACHE_KEY = "DW_MODEL_COLUMN";

  @Resource
  private DWDAO dwdao;

  public DWDAO getDwdao() {
    return dwdao;
  }

  public void setDwdao(DWDAO dwdao) {
    this.dwdao = dwdao;
  }

  @Override
  public List<Table> listPhysicalTable(boolean refresh) {
    List<Table> tableList = null;

    if(refresh) {
      clearCache(TABLE_CACHE_KEY);
    } else {
      tableList = (List<Table>) cacheUtil.get(TABLE_CACHE_KEY);
    }

    if (tableList == null) {
      tableList = dwdao.listPhysicalTable();
      cacheUtil.put(TABLE_CACHE_KEY, tableList);
    }

    return tableList;
  }

  @Override
  public List<Column> listPhysicalColumn(boolean refresh) {
    List<Column> columnList = null;

    if(refresh) {
      clearCache(COLUMN_CACHE_KEY);
    } else {
      columnList = (List<Column>) cacheUtil.get(COLUMN_CACHE_KEY);
    }

    if (columnList == null) {
      columnList = dwdao.listPhysicalColumn();
      cacheUtil.put(COLUMN_CACHE_KEY, columnList);
    }

    return columnList;
  }

  private void clearCache(String cachekEY) {
    cacheUtil.remove(cachekEY);
  }
}
