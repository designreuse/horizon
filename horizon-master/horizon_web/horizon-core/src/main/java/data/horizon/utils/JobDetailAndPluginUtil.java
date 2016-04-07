package data.horizon.utils;
import data.horizon.core.config.model.JobDetail;
import data.horizon.core.config.model.Sqoop;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by huyang on 2016/3/17.
 */
public class JobDetailAndPluginUtil {

  public static Sqoop doJobDetails2Sqoop(List<Map<String,String>> map)
  {
    return null;
  }

  public static List<JobDetail> doSqoop2JobDetails(Sqoop sqoop) throws ClassNotFoundException,NoSuchMethodException,InvocationTargetException,IllegalAccessException
  {
    List<JobDetail> jobDetails = new ArrayList<JobDetail>();
    List<String> fieldNames = getFieldNames(sqoop);
    Class<Sqoop> clz = Sqoop.class;
    Method method;
    int job_id = sqoop.getJob_id();
    int plugin_id = sqoop.getPlugin();
    for(String fieldName:fieldNames)
    {
      method = clz.getDeclaredMethod(getGetterName(fieldName));
      jobDetails.add(new JobDetail(job_id,plugin_id,fieldName,method.invoke(sqoop)));
    }
    return jobDetails;
  }

  private static List<String> getFieldNames(Object o)
  {
    Class<?> clz = o.getClass();
    Field[] fields = clz.getDeclaredFields();
    List<String> fieldNames = new ArrayList<String>();
    for(Field field:fields)
    {
      fieldNames.add(field.getName());
    }
    return fieldNames;
  }

  private static String getGetterName(String suffix)
  {
    return "get" + fisrtChar2Upper(suffix);
  }

  private static String getSetterName(String suffix)
  {
    return "set" + fisrtChar2Upper(suffix);
  }

  private static String fisrtChar2Upper(String s)
  {
    char[] c = s.toCharArray();
    c[0] -= 32;
    return String.valueOf(c);
  }
}
