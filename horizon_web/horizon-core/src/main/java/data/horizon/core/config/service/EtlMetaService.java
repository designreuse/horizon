package data.horizon.core.config.service;

import data.horizon.core.config.model.ReportJob;

import java.util.List;

/**
 * Created by huangshiqian on 15/11/24.
 */
public interface EtlMetaService {

  List<ReportJob> reportJoblist();
}
