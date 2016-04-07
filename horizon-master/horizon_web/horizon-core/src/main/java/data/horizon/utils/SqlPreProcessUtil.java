package data.horizon.utils;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

/**
 * Created by huyang on 2016/3/23.
 */
public class SqlPreProcessUtil {
  public static List<String> preProcess(String hive_command, String hive_db, String hive_table_name)
  {
    List<String> sqls = new ArrayList<String>();
    Pattern p1 = Pattern.compile("\\$\\{db_name\\}");
    Pattern p2 = Pattern.compile("\\$\\{hive_table_name\\}");
    Pattern p3 = Pattern.compile("^set", Pattern.CASE_INSENSITIVE);
    //替换hive_command中的参数${db_name}
    String s1 = p1.matcher(hive_command).find() ? p1.matcher(hive_command).replaceAll(hive_db) : hive_command;
    //替换hive_command中的参数${hive_table_name}
    String s2 = p2.matcher(s1).find() ? p2.matcher(s1).replaceAll(hive_table_name) : s1;
    for (String s3 : s2.split(";"))
    {
      String s4 = s3.trim().replaceAll("\r|\n", "");
      //去掉set语句和空行
      if (p3.matcher(s4).find() || s4.length() == 0) {
        continue;
      }
      sqls.add(s3);
    }
    return sqls;
  }
}
