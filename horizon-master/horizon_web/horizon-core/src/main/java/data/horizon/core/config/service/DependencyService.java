package data.horizon.core.config.service;

/**
 * Created by huyang on 2016/1/15.
 */
public interface DependencyService {
  public String getAllDependencyGraph();
  public String getOneDependencyGraph(String name);
}
