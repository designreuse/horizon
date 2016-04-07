package data.horizon.utils;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/**
 * Created by huangshiqian on 15/10/29.
 */
public class LocalCacheUtil {
  private static Logger logger = LoggerFactory.getLogger(LocalCacheUtil.class);

  private static final LocalCacheUtil cacheUtil = new LocalCacheUtil();
  private ConcurrentMap cache = new ConcurrentHashMap<>();

  private LocalCacheUtil() {
    logger.info("[LocalCacheUtil] Init Local Cache");

    Runtime.getRuntime().addShutdownHook(new Thread() {
      @Override
      public void run() {
        logger.info("[LocalCacheUtil] Clear Local Cache When Application Shut Down");
        cache.clear();
      }
    });
//    registShutDownHook();
  }

//  private void registShutDownHook() {
//    Runtime.getRuntime().addShutdownHook(new Thread() {
//      @Override
//      public void run() {
//        System.out.println("============= clear cache when application shut down ==============");
//        cache.clear();
//      }
//    });
//  }

  public static LocalCacheUtil getInstance() {
    return cacheUtil;
  }

  public synchronized Object get(String key) {
    logger.debug("[get] Get Data From Local Cache Key = " + key);

    return cache.get(key);
  }

  public synchronized void put(String key, Object value) {
    logger.info("[put] Add Data To Local Cache Key = " + key);
    cache.put(key, value);
  }

  public synchronized void remove(String key) {
    logger.info("[put] Remove Data From Local Cache Key = " + key);
    cache.remove(key);
  }
}
