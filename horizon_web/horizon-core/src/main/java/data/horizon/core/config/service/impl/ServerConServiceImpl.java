package data.horizon.core.config.service.impl;

import data.horizon.core.config.dao.ServerDAO;
import data.horizon.core.config.dao.impl.ServerDAOImpl;
import data.horizon.core.config.model.ServerInfo;
import data.horizon.core.config.service.ServerConService;
import data.horizon.utils.LocalCacheUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by haolijs on 2016/3/17.
 */
@Service
public class ServerConServiceImpl implements ServerConService {

    private static final String KEY="SERVER_LIST";

    private static LocalCacheUtil cache=LocalCacheUtil.getInstance();


    @Resource
    private ServerDAO serverDAO;

    @Override
    public List<ServerInfo> list() {
        List<ServerInfo> serverInfo=(List<ServerInfo>)cache.get(KEY);
        if(serverInfo==null)
        {
            serverInfo=serverDAO.list();
            cache.put(KEY,serverInfo);
        }
        return serverInfo;
    }

    @Override
    public void update(ServerInfo serverInfo) {
        serverDAO.update(serverInfo);
        cache.remove(KEY);
    }

    @Override
    public void add(ServerInfo serverInfo) {
        serverDAO.insert(serverInfo);
        cache.remove(KEY);
    }

    @Override
    public ServerInfo updateDBStatus(int server_id) {


        serverDAO.updateDBStatus(server_id);

        ServerInfo serverInfo = serverDAO.queryOne(server_id);
        cache.remove(KEY);
        return serverInfo;
    }

    @Override

    public void delete(int server_id){

        serverDAO.delete(server_id);
        cache.remove(KEY);
    }
}
