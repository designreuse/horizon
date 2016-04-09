package data.horizon.core.config.dao.impl;

import com.sun.corba.se.spi.activation.Server;
import data.horizon.core.config.dao.BaseDAO;
import data.horizon.core.config.dao.ServerDAO;
import data.horizon.core.config.model.ServerInfo;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by haolijs on 2016/3/17.
 */
@Repository
public class ServerDAOImpl extends BaseDAO implements ServerDAO {
    @Resource
    private SqlSessionTemplate sqlSession;

    @Override
    public List<ServerInfo> list(){

        return (List<ServerInfo>) super.queryList("data.horizon.core.config.model.server.list", null);
    }

    @Override

    public void update(ServerInfo serverInfo){

        super.update("data.horizon.core.config.model.server.update", serverInfo);
    }

    @Override

    public void insert(ServerInfo serverInfo){

        super.save("data.horizon.core.config.model.server.insert", serverInfo);
    }

    @Override

    public SqlSessionTemplate getSqlSession(){
        return sqlSession;
    }

    @Override
    public Object updateDBStatus(int server_id) {
        return super.update("data.horizon.core.config.model.server.update_status", server_id);
    }

    @Override
    public ServerInfo queryOne(int server_id) {
        return (ServerInfo)super.queryOne("data.horizon.core.config.model.server.query", server_id);
    }

    @Override

    public void delete(int server_id){
         super.delete("data.horizon.core.config.model.server.server_delete", server_id);
    }


}
