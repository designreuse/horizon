package data.horizon.analysis.util;

import data.horizon.analysis.Resource;
import data.horizon.analysis.Type;
import redis.clients.jedis.Jedis;

import java.io.IOException;
import java.util.*;

/**
 * Created by huyang on 2016/1/6.
 */



public class RedisUtil<T extends Resource> {
  private SerializeUtil<T> serializeUtil = new SerializeUtil<T>();
  protected Jedis jedis;

  //获取jedis资源
  public RedisUtil()
  {
    this.jedis = JedisUtil.getResource();
  }

  //释放jedis资源
  public void returnResource()
  {
    if(jedis != null) {
      JedisUtil.returnResource(this.jedis);
    }
  }

  //添加对象t
  public void add(T t) throws IOException
  {
    if(this.jedis != null) {
      jedis.hset(t.getType().toString().getBytes(),t.getName().getBytes(),serializeUtil.serialize(t));
    }
  }

  //删除对象t
  public void del(Type type,String key)
  {
    if(this.jedis != null) {
      jedis.hdel(type.toString(),key);
    }
  }

  //修改对象t
  public void update(T t) throws IOException
  {
    if(this.jedis != null) {
      jedis.hdel(t.getType().toString(),t.getName());
    }
  }
  //获取对象
  public T get(Type type,String key) throws IOException,ClassNotFoundException
  {
    if(this.jedis != null) {
      return serializeUtil.unserialize(jedis.hget(type.toString().getBytes(), key.getBytes()));
    }
    return null;
  }
  //获取所有对象
  public List<T> getAll(Type type) throws IOException,ClassNotFoundException
  {
    if(jedis != null){
      Map<byte[],byte[]> map = jedis.hgetAll(type.toString().getBytes());
      if(map.size() == 0 || map == null) {
        return null;
      }else {
        List<T> list = new java.util.ArrayList<T>();
        for(Map.Entry<byte[],byte[]> m:map.entrySet())
        {
          list.add(serializeUtil.unserialize(m.getValue()));
        }
        return  list;
      }
    }
    return null;
  }

  public Map<String,BaseInfo> getBaseInfo() throws IOException,ClassNotFoundException
  {
    Map<String,BaseInfo> result = new HashMap<String,BaseInfo>();
    SerializeUtil<BaseInfo> serializeUtil = new SerializeUtil<BaseInfo>();
    if(jedis != null)
    {
      Map<byte[],byte[]> map = jedis.hgetAll(Type.BASE.toString().getBytes());
      for(Map.Entry<byte[],byte[]> entry:map.entrySet())
      {
        String name = new String(entry.getKey(),0,entry.getKey().length);
        BaseInfo baseInfo = serializeUtil.unserialize(entry.getValue());
        result.put(name,baseInfo);
      }
    }
    return result;
  }
}
