package data.horizon.analysis.util;

import data.horizon.analysis.Operation;
import data.horizon.analysis.Table;
import data.horizon.analysis.Type;

import java.io.IOException;
import java.util.*;

/**
 * Created by huyang on 2016/1/11.
 */
public class TableUtil {

  private static List<BaseInfo> baseInfo;
  public static List<Table> init() throws IOException,ClassNotFoundException
  {
    RedisUtil<Table> redisUtil = new RedisUtil<Table>();
    //初始化结果集
    List<Table> list = new ArrayList<Table>();
    //存储每个表所依赖的作业
    Set<String> dependencyJob;
    //存储每个表被依赖的作业
    Set<String> byDependencyJob;
    for(String tableName:getAllTableNames())
    {
      Table table = new Table(tableName);
      dependencyJob = new HashSet<String>();
      byDependencyJob = new HashSet<String>();
      for(BaseInfo base:baseInfo)
      {
        for(Map.Entry<Operation,Set<String>> entry:base.getTableAccessInfo().entrySet())
        {
          if(entry.getValue().contains(tableName)){
            String operation = entry.getKey().toString().toUpperCase();
            //如果是insert或者alter操作，表示依赖此作业;如果是select操作，表示被此作业依赖
            if(operation.equals(Operation.INSERT.toString()) || operation.equals(Operation.ALTER.toString())){
              dependencyJob.add(base.getName());
            }else if(operation.equals(Operation.SELECT.toString())) {
              byDependencyJob.add(base.getName());
            }
          }
        }
      }
      table.setDependencyJob(dependencyJob);
      table.setByDependencyJob(byDependencyJob);
      list.add(table);
      redisUtil.add(table);
    }
    redisUtil.returnResource();
    return list;
  }

  public static void dump(List<Table> tableList)
  {
    for(Table table:tableList)
    {
      System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
      System.out.println(table.getName());
      if(table.getDependencyJob().size() > 0 && table.getByDependencyJob().size() > 0) {
        System.out.println("B:"+table.getByDependencyJob().toString());
        System.out.println("D:"+table.getDependencyJob().toString());
      }else if(table.getDependencyJob().size() > 0){
        System.out.println("D:"+table.getDependencyJob().toString());
      }else if(table.getByDependencyJob().size() > 0){
        System.out.println("B:"+table.getByDependencyJob().toString());
      }
      System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    }
  }

  private static Set<String> getAllTableNames() throws IOException,ClassNotFoundException
  {
    RedisUtil<BaseInfo> baseInfoRedisUtil = new RedisUtil<BaseInfo>();
    baseInfo = baseInfoRedisUtil.getAll(Type.BASE);
    Set<String> tables = new HashSet<String>();
      for(BaseInfo base:baseInfo)
      {
        try {
          for(Set<String> set:base.getTableAccessInfo().values())
          {
            tables.addAll(set);
          }
        }catch (Exception e){
          System.out.println(base.getName());
        }
      }
    baseInfoRedisUtil.returnResource();
    return tables;
  }
  public static void main(String[] args) throws Exception{
    dump(init());
  }
}
