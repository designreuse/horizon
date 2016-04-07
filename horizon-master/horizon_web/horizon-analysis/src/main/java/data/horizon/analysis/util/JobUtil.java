package data.horizon.analysis.util;

import data.horizon.analysis.Job;
import data.horizon.analysis.Operation;
import data.horizon.analysis.Table;
import data.horizon.analysis.Type;

import java.io.IOException;
import java.util.*;

/**
 * Created by huyang on 2016/1/11.
 */
public class JobUtil {

  public static List<Job> init() throws IOException,ClassNotFoundException
  {
    RedisUtil<Job> jobRedisUtil = new RedisUtil<Job>();
    List<Job> list = new ArrayList<Job>();
    List<Table> tables = getAllTables();
    Set<String> dependency;
    Set<String> byDependency;
    for(BaseInfo baseInfo:jobRedisUtil.getBaseInfo().values())
    {
      Job job = new Job(baseInfo.getName());
      dependency = new HashSet<String>();
      byDependency = new HashSet<String>();
      for(Map.Entry<Operation,Set<String>> entry:baseInfo.getTableAccessInfo().entrySet())
      {
        Set<String> set = entry.getValue();
        if(entry.getKey().toString().equals(Operation.INSERT.toString()) || entry.getKey().toString().equals(Operation.ALTER.toString())){
          for(Table table:tables)
          {
            if(set.contains(table.getName())){
              byDependency.addAll(table.getByDependencyJob());
            }
          }
        }else if(entry.getKey().toString().equals(Operation.SELECT.toString())){
          for(Table table:tables)
          {
            if(set.contains(table.getName())){
              dependency.addAll(table.getDependencyJob());
            }
          }
        }
      }
      dependency.remove(baseInfo.getName());
      byDependency.remove(baseInfo.getName());
      job.setDependencyJob(dependency);
      job.setByDependencyJob(byDependency);
      jobRedisUtil.add(job);
      list.add(job);
    }
    jobRedisUtil.returnResource();
    return list;
  }

  public static class Z
  {
    private static Map<String,Job> map;
    private static RedisUtil<Job> jobRedisUtil;
    private static Set<String> traversed;
    static
    {
      map = new HashMap<String,Job>();
      jobRedisUtil = new RedisUtil<Job>();
      traversed = new HashSet<String>();
      try {
        for(Job job:jobRedisUtil.getAll(Type.JOB))
        {
          map.put(job.getName(),job);
        }
      }catch (Exception e){
        e.printStackTrace();
      }finally {
        jobRedisUtil.returnResource();
      }
    }
    public static void getJobDenpendencyChain(String jobName,int hierarchy)
    {
      if(hierarchy == 0){System.out.println(jobName);}
      Set<String> dependency = map.get(jobName).getDependencyJob();
      int current = hierarchy + 2;
      traversed.add(jobName);
      if(dependency.size() > 0) {
        for(String s:dependency)
        {
          for(int i = 0;i < current;i++){System.out.print(" ");}
          System.out.println(s);
          if(!traversed.contains(s)) {
            getJobDenpendencyChain(s,current);
          }
        }
      }
    }
  }

  public static void dump(List<Job> jobList)
  {
    for(Job job:jobList)
    {
      System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++");
      System.out.println(job.getName());
      System.out.println("B:" + job.getByDependencyJob().toString());
      System.out.println("D:" + job.getDependencyJob().toString());
      System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++");
    }
  }

  private static List<Table> getAllTables() throws IOException,ClassNotFoundException
  {
    RedisUtil<Table> tableRedisUtil = new RedisUtil<Table>();
    return tableRedisUtil.getAll(Type.TABLE);
  }

  public static void main(String[] args) throws Exception{
    dump(init());
  }
}