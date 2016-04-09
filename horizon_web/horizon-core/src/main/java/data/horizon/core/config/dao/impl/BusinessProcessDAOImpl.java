package data.horizon.core.config.dao.impl;

import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.BusinessProcessDAO;
import data.horizon.core.config.model.BusinessProcess;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by haolijs on 2016/3/31.
 */
@Repository
public class BusinessProcessDAOImpl extends BaseDAO implements BusinessProcessDAO{

    @Resource
    private SqlSessionTemplate sqlSession;

    @Override
    public SqlSessionTemplate getSqlSession(){
        return sqlSession;
    }

    @Override
    public List<BusinessProcess> list() {
            return  (List<BusinessProcess>) super.queryList("data.horizon.core.config.model.businessprocess.list", null);
    }

    @Override
    public void update(BusinessProcess businessProcess) {
        super.update("data.horizon.core.config.model.businessprocess.update", businessProcess);
    }

    @Override
    public void insert(BusinessProcess businessProcess) {
        super.save("data.horizon.core.config.model.businessprocess.insert", businessProcess);
    }

    @Override
    public Object updateDBStatus(int business_process_id) {
        return null;
    }

    @Override
    public BusinessProcess queryOne(int business_process_id) {
        return null;
    }

    @Override
    public void delete(int business_process_id) {
        super.delete("data.horizon.core.config.model.businessprocess.business_process_delete", business_process_id);
    }
}
