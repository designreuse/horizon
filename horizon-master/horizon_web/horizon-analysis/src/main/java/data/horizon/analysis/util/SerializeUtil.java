package data.horizon.analysis.util;

import data.horizon.analysis.Resource;

import java.io.*;

/**
 * Created by huyang on 2015/12/31.
 */
public class SerializeUtil<T extends Resource> {
  public byte[] serialize(T t) throws IOException
  {
    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
    ObjectOutputStream objectOutputStream = new ObjectOutputStream(byteArrayOutputStream);
    objectOutputStream.writeObject(t);
    byte[] bytes = byteArrayOutputStream.toByteArray();
    return bytes;
  }

  public T unserialize(byte[] bytes) throws IOException,ClassNotFoundException
  {
    ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(bytes);
    ObjectInputStream objectInputStream = new ObjectInputStream(byteArrayInputStream);
    T t = (T)objectInputStream.readObject();
    return t;
  }
}
