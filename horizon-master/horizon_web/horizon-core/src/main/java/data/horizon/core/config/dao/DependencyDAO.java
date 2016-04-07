package data.horizon.core.config.dao;

import data.horizon.analysis.Resource;
import data.horizon.analysis.Type;

import java.util.List;

/**
 * Created by huyang on 2016/1/15.
 */
public interface DependencyDAO<T extends Resource>{
  public List<T> getAll();
  public T getOne(String name);
}
