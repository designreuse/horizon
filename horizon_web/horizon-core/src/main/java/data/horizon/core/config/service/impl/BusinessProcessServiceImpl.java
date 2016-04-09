package data.horizon.core.config.service.impl;

import data.horizon.core.config.dao.BusinessProcessDAO;
import data.horizon.core.config.model.BusinessProcess;
import data.horizon.core.config.service.BusinessProcessService;
import data.horizon.utils.LocalCacheUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by haolijs on 2016/4/1.
 */
@Service
public class BusinessProcessServiceImpl implements BusinessProcessService{

    private static final String KEY="BUSINESS_PEOCESS_LIST";

    private static LocalCacheUtil cache=LocalCacheUtil.getInstance();

    @Resource
   private BusinessProcessDAO businessProcessDAO;

    @Override
    public List<BusinessProcess> list() {
        List<BusinessProcess> businessProcesses= (List<BusinessProcess>) cache.get(KEY);

        if (businessProcesses==null){

            businessProcesses=businessProcessDAO.list();

            cache.put(KEY,businessProcesses);
        }
         return  businessProcesses;
    }

    @Override
    public void update(BusinessProcess businessProcess) {

        businessProcessDAO.update(businessProcess);
        cache.remove(KEY);
    }

    @Override
    public void add(BusinessProcess businessProcess) {
        businessProcessDAO.insert(businessProcess);
        cache.remove(KEY);
    }

    @Override
    public void delete(int business_process_id) {

        businessProcessDAO.delete(business_process_id);

        cache.remove(KEY);

    }
}
