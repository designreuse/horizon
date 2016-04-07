package data.horizon.core.config.dao.impl;

import data.horizon.analysis.Job;
import data.horizon.analysis.Type;
import data.horizon.analysis.util.RedisUtil;
import data.horizon.core.config.dao.DependencyDAO;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by huyang on 2016/1/15.
 */

@Repository
public class JobDependencyDAOImpl implements DependencyDAO<Job> {

  @Override
  public List<Job> getAll(){
    RedisUtil<Job> jobRedisUtil = new RedisUtil<Job>();
    try {
      List<Job> jobs = jobRedisUtil.getAll(Type.JOB);
      return jobs;
    }catch (Exception e){
      e.printStackTrace();
    }finally {
      jobRedisUtil.returnResource();
    }
    return null;
  }

  @Override
  public Job getOne(String name) {
    RedisUtil<Job> jobRedisUtil = new RedisUtil<Job>();
    try {
      Job job = jobRedisUtil.get(Type.JOB,name);
      return job;
    }catch (Exception e){
      e.printStackTrace();
    }finally {
      jobRedisUtil.returnResource();
    }
    return null;
  }
}
