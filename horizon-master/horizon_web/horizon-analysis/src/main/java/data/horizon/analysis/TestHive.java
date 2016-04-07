package data.horizon.analysis;

import data.horizon.analysis.sql.HiveSqlVisitor;
import data.horizon.analysis.util.BaseInfo;
import data.horizon.analysis.util.RedisUtil;
import org.antlr.runtime.tree.CommonTree;

import java.sql.*;
import java.util.Map;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by huyang on 2015/12/23.
 */
public class TestHive {

  public static void main(String[] args) throws Exception {

    String driver = "com.mysql.jdbc.Driver";
    String url = "jdbc:mysql://192.168.95.55:3306/etl_meta";
    String username = "root";
    String password = "dw_etl";
    Class.forName(driver);
    Connection connection = DriverManager.getConnection(url, username, password);
    PreparedStatement ps = connection.prepareCall("select sqp_job_name,hive_db,hive_table_name,hive_command from etl_meta_sqoop_job_v1_20160111 where hive_command <> '' order by sqp_job_id;");
    ResultSet rs = ps.executeQuery();
    String jobName;
    String hive_db;
    String hiveSqls;
    String hiveTableName;
    BaseInfo baseInfo;
    Pattern p1 = Pattern.compile("\\$\\{hive_table_name\\}");
    Pattern p2 = Pattern.compile("^set",Pattern.CASE_INSENSITIVE);
    Pattern p3 = Pattern.compile("\\$\\{db_name\\}");
    Matcher m2;
    Plan plan;
    //RedisUtil<BaseInfo> redisUtil = new RedisUtil <BaseInfo>();
    Analysiser analysiser = AnalysiserFactory.build(ActionType.HIVESQL);
    Visitor visitor;

    while (rs.next()) {
      visitor = VisitorFactory.build(ActionType.HIVESQL);
      jobName = rs.getString(1);
      hive_db = rs.getString(2);
      hiveTableName = rs.getString(3);
      hiveSqls = rs.getString(4);
      String s = p1.matcher(hiveSqls).find() ? p1.matcher(hiveSqls).replaceAll(hiveTableName) : hiveSqls;
      String s1 = p3.matcher(s).find() ? p3.matcher(s).replaceAll(hive_db):s;
      baseInfo = new BaseInfo(jobName);
      boolean success = true;
      for (String sql : s1.split(";")) {
        String q = sql.trim().replaceAll("\r|\n", "");
        if(q.length() == 0) {continue;}
        m2 = p2.matcher(q);
        if (!m2.find()) {
          try {
            plan = analysiser.analysis(sql);
            visitor.setDefaultDB(hive_db);
            plan.accept(visitor);
            success = true;
          }catch (Exception e){
            e.printStackTrace();
            //redisUtil.returnResource();
            System.out.println("++++++++++++++++");
            success = false;
            break;
          }
        }
      }

      if(success){
        baseInfo.setTableAccessInfo(visitor.getTableAccessInfo());
 //       redisUtil.add(baseInfo);
//        System.out.println("***********************************************************************");
//        System.out.println(jobName);
//        for(Map.Entry<Operation,Set<String>> entry:visitor.getTableAccessInfo().entrySet())
//        {
//          System.out.println(entry.getKey().toString()+":"+entry.getValue().toString());
//        }
//        System.out.println("***********************************************************************");
      }
    }
//    redisUtil.returnResource();
  }
}
