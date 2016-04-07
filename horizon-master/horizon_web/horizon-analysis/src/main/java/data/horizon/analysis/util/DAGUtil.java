package data.horizon.analysis.util;

import data.horizon.analysis.Job;
import data.horizon.analysis.Type;

import java.util.List;

/**
 * Created by huyang on 2016/1/11.
 */
public class DAGUtil {

  private static List<Job> jobs;
  private static byte[][] adjacentMatrix;

  public static void main(String[] args) throws Exception
  {
    getAdjacentMatrix();
    dump();
  }

  public static void getAdjacentMatrix() throws Exception
  {
    RedisUtil<Job> redisUtil = new RedisUtil<Job>();
    jobs = redisUtil.getAll(Type.JOB);
    int size = jobs.size();
    adjacentMatrix = new byte[size][size];
    for(int i=0;i<size;i++)
    {
      Job out = jobs.get(i);
      for(int j=0;j<size;j++)
      {
        Job inner = jobs.get(j);
        if(i == j){
          adjacentMatrix[i][j] = 0;
        }else if(out.getByDependencyJob().contains(inner.getName())){
          adjacentMatrix[i][j] = 1;
        }else{
          adjacentMatrix[i][j] = 0;
        }
      }
    }
  }

  public static void dump()
  {
    for(int i = 0;i<=adjacentMatrix.length;i++)
    {
      for(int j=0;j<=adjacentMatrix.length;j++)
      {
        if(i == 0 && j == 0) {
          System.out.print("      ");
        }else if(i == 0 && j > 0){
          System.out.print(jobs.get(j - 1).getName());
          System.out.print("  ");
        }else if(i > 0 && j == 0) {
          System.out.print(jobs.get(i - 1).getName());
        }else {
          System.out.print("   ");
          System.out.print(adjacentMatrix[i-1][j-1]);
          System.out.print("  ");
        }
      }
      System.out.println();
    }
  }
}
