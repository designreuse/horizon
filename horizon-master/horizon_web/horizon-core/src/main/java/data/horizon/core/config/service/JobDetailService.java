package data.horizon.core.config.service;

import data.horizon.core.config.model.JobDetail;
import data.horizon.core.config.model.Sqoop;

import java.util.List;
import java.util.Map;

/**
 * Created by huyang on 2016/3/17.
 */
public interface JobDetailService {
  List<Map<String,String>> get();
  void add(Sqoop sqoop) throws Exception;
}
