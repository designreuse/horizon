package data.horizon.core.config.dao;

import data.horizon.core.config.model.JobDetail;

import java.util.List;

/**
 * Created by huyang on 2016/3/17.
 */
public interface JobDetailDAO {
  List<JobDetail> get();
  void add(List<JobDetail> jobDetails);
}
