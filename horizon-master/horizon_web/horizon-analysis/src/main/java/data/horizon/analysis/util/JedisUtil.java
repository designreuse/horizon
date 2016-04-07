package data.horizon.analysis.util;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

/**
 * Created by huyang on 2015/12/31.
 */
public class JedisUtil {

  private static JedisPool jedisPool;

  //连接池中最大连接数
  private static final int MAX_ACTIVE = 50;
  //连接池冲最大空闲连接数
  private static int MAX_IDLE = 3;
  //Redis服务器
  private static String HOST = "192.168.95.10";
  //Redis端口
  private static int PORT = 6379;
  //Redis认证密码
  private static String AUTH = "huyang";
  //连接超时时间
  private static int TIMEOUT = 10000;

  static
  {
    try {
      JedisPoolConfig config = new JedisPoolConfig();
      config.setMaxTotal(MAX_ACTIVE);
      config.setMaxIdle(MAX_IDLE);
      jedisPool = new JedisPool(config,HOST,PORT,TIMEOUT,AUTH);
    }catch (Exception e){
      e.printStackTrace();
    }
  };

  //获取Jedis资源
  public static Jedis getResource()
  {
    return jedisPool.getResource();
  }

  //释放Jedis资源
  public static void returnResource(final Jedis jedis)
  {
    if(jedis != null)
    {
      jedisPool.returnResource(jedis);
    }
  }

}
