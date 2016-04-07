package data.horizon.analysis;


import java.util.Map;
import java.util.Set;

/**
 * Created by huyang on 2015/12/23.
 */
public abstract class Visitor<T> {
    protected Map<Operation,Set<String>> tableAccessInfo;

    protected String defaultDB;

    public Map<Operation, Set<String>> getTableAccessInfo() {
        return tableAccessInfo;
    }

    public void setTableAccessInfo(Map<Operation, Set<String>> tableAccessInfo) {
        this.tableAccessInfo = tableAccessInfo;
    }

    public String getDefaultDB() {
        return defaultDB;
    }

    public void setDefaultDB(String defaultDB) {
        this.defaultDB = defaultDB;
    }

    public abstract void visit(T t);
}
