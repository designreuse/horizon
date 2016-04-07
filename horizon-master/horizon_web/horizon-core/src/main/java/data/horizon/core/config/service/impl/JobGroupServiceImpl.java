package data.horizon.core.config.service.impl;

import data.horizon.core.config.dao.JobGroupDAO;
import data.horizon.core.config.model.JobGroup;
import data.horizon.core.config.service.JobGroupService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by huyang on 2016/2/29.
 */
@Service
public class JobGroupServiceImpl implements JobGroupService{

  @Resource
  private JobGroupDAO jobGroupDAO;

  @Override
  public List<JobGroup> getAll() {
    return jobGroupDAO.getAll();
  }

  @Override
  public void add(JobGroup jobGroup) {
    jobGroupDAO.add(jobGroup);
  }

  @Override
  public void update(JobGroup jobGroup) {
    jobGroupDAO.update(jobGroup);
  }
}
