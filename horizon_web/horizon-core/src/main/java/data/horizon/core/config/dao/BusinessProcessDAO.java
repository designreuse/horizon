package data.horizon.core.config.dao;

import data.horizon.core.config.model.BusinessProcess;


import java.util.List;

/**
 * Created by haolijs on 2016/3/31.
 */
public interface BusinessProcessDAO {

    public List<BusinessProcess> list();
    public void update(BusinessProcess businessProcess);
    public void insert(BusinessProcess businessProcess);
    Object updateDBStatus(int business_process_id);
    BusinessProcess queryOne(int business_process_id);
    public void delete(int business_process_id);

}
