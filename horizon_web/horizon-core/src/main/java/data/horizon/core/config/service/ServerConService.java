package data.horizon.core.config.service;

import data.horizon.core.config.model.ServerInfo;
import data.horizon.core.config.model.SqoopJob;

import java.util.List;

/**
 * Created by haolijs on 2016/3/17.
 */
public interface ServerConService {
    public List<ServerInfo> list();
    public void update(ServerInfo serverInfo);
    public void add(ServerInfo serverInfo);
    ServerInfo updateDBStatus(int server_id);
    public void delete(int server_id);
}
