package data.horizon.core.config.service.impl;

import data.horizon.core.config.dao.JobInfoDAO;
import data.horizon.core.config.model.JobInfo;
import data.horizon.core.config.service.JobInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huyang on 2016/2/29.
 */
@Service
public class JobInfoServiceImpl implements JobInfoService {

  @Resource
  private JobInfoDAO jobInfoDAO;

  @Override
  public List<JobInfo> getAll() {
    return jobInfoDAO.getAll();
  }

  @Override
  public int add(JobInfo jobInfo) {
     return jobInfoDAO.add(jobInfo);
  }

  @Override
  public void update(JobInfo jobInfo) {
    jobInfoDAO.update(jobInfo);
  }
}
