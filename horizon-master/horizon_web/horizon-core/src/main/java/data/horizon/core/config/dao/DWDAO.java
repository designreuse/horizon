package data.horizon.core.config.dao;

import data.horizon.core.config.model.Column;
import data.horizon.core.config.model.DimensionModel;
import data.horizon.core.config.model.Table;

import java.util.List;

/**
 * Created by huangshiqian on 15/11/14.
 */
public interface DWDAO {
  List<Table> listPhysicalTable();

  List<Column> listPhysicalColumn();
}
