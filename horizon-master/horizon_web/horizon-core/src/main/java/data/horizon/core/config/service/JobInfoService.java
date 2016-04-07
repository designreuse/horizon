package data.horizon.core.config.service;

import data.horizon.core.config.model.JobInfo;

import java.util.List;

/**
 * Created by huyang on 2016/2/29.
 */
public interface JobInfoService {
  List<JobInfo> getAll();
  int add(JobInfo jobInfo);
  void update(JobInfo jobInfo);
}
