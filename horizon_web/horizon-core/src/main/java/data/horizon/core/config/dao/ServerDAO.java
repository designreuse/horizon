package data.horizon.core.config.dao;

import data.horizon.core.config.model.ServerInfo;

import java.util.List;

/**
 * Created by haolijs on 2016/3/17.
 */
public interface ServerDAO {
    public List<ServerInfo> list();
    public void update(ServerInfo serverInfo);
    public void insert(ServerInfo serverInfo);
    Object updateDBStatus(int server_id);
    ServerInfo queryOne(int server_id);
    public void delete(int server_id);
}
