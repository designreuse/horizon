package data.horizon.core.config.dao;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;

import javax.annotation.Resource;

public abstract class BaseDAO {

  /**
   * 方法说明:返回DB连接的session,需要在子类中实现
   * @return SqlSessionTemplate
   */
  public abstract SqlSessionTemplate getSqlSession();

	/**
	 * 方法说明：返回单个对象信息
	 */
	public Object queryOne(String key, Object obj) {
		return getSqlSession().selectOne(key, obj);
	}

	/**
	 * 方法说明：返回集合信息
	 */
	public Object queryList(String key, Object obj) {
		return getSqlSession().selectList(key, obj);
	}

	public Object queryList(String key, Object obj, int offset, int count) {
		RowBounds rowBounds = new RowBounds(offset, count);
		return getSqlSession().selectList(key, obj, rowBounds);
	}

	/**
	 * 方法说明：信息统计
	 */
	public Object countQuery(String key, Object obj) {
		return getSqlSession().selectOne(key, obj);
	}

  /**
   * 方法说明：插入数据
   */
  public Object save(String key, Object obj) {
    return getSqlSession().insert(key, obj);
  }

  /**
   * 方法说明：更新记录
   */
  public Object update(String key, Object obj) {
    return getSqlSession().update(key, obj);
  }
}
