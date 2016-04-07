package data.horizon.core.config.service;

import data.horizon.core.config.model.JobGroup;

import java.util.List;

/**
 * Created by huyang on 2016/2/26.
 */
public interface JobGroupService {
  List<JobGroup> getAll();
  void add(JobGroup jobGroup);
  void update(JobGroup jobGroup);
}
