package data.horizon.core.config.dao;

import data.horizon.core.config.model.ReportJob;

import java.util.List;

/**
 * Created by huangshiqian on 15/11/24.
 */
public interface EtlMetaDAO {
  List<ReportJob> listReportJobs();
}
