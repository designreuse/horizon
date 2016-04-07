package data.horizon.core.config.service.impl;

import data.horizon.core.config.dao.EtlMetaDAO;
import data.horizon.core.config.model.ReportJob;
import data.horizon.core.config.service.EtlMetaService;
import data.horizon.utils.LocalCacheUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huangshiqian on 15/11/24.
 */
@Service
public class EtlMetaServiceImpl implements EtlMetaService {
  private static Logger logger = LoggerFactory.getLogger(EtlMetaServiceImpl.class);
  private static LocalCacheUtil cacheUtil = LocalCacheUtil.getInstance();

  @Resource
  private EtlMetaDAO dbConfigDAO;

  @Override
  public List<ReportJob> reportJoblist() {
    return dbConfigDAO.listReportJobs();
  }
}
