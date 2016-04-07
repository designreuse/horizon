package data.horizon.core.config.dao;

import data.horizon.core.config.model.JobGroup;

import java.util.List;

/**
 * Created by huyang on 2016/2/26.
 */
public interface JobGroupDAO {
  List<JobGroup> getAll();
  void add(JobGroup jobGroup);
  void update(JobGroup jobGroup);
}
