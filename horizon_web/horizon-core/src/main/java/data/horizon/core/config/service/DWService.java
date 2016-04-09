package data.horizon.core.config.service;

import data.horizon.core.config.model.Column;
import data.horizon.core.config.model.DimensionModel;
import data.horizon.core.config.model.Table;

import java.util.List;

/**
 * Created by huangshiqian on 15/11/14.
 */
public interface DWService {
  List<Table> listPhysicalTable(boolean refresh);

  List<Column> listPhysicalColumn(boolean refresh);
}
