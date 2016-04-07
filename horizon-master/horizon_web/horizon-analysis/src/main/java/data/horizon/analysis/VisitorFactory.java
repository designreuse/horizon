package data.horizon.analysis;

import data.horizon.analysis.sql.HiveSqlVisitor;

/**
 * Created by huyang on 2015/12/23.
 */
public class VisitorFactory{

    public static Visitor build(ActionType actionType) {
        if(ActionType.HIVESQL.equals(actionType))
        {
            return createHiveSqlVisitor();
        }else{
            return null;
        }
    }

    private static HiveSqlVisitor createHiveSqlVisitor()
    {
        return  new HiveSqlVisitor();
    }
}
