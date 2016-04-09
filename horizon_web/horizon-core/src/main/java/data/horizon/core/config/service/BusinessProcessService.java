package data.horizon.core.config.service;

import data.horizon.core.config.model.BusinessProcess;

import java.util.List;

/**
 * Created by haolijs on 2016/4/1.
 */
public interface BusinessProcessService {

    public List<BusinessProcess> list();
    public void update(BusinessProcess businessProcess);
    public void add(BusinessProcess businessProcess);
   // BusinessProcess updateDBStatus(int business_process_id);
    public void delete(int business_process_id);
}
