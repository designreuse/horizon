package data.horizon.analysis;

import data.horizon.analysis.sql.HiveSqlAnalysiser;

/**
 * Created by huyang on 2015/12/23.
 */
public class AnalysiserFactory{

    public static Analysiser build(ActionType actionType) {
        if(ActionType.HIVESQL.equals(actionType))
        {
            return createHiveSqlAnalysiser();
        }else {
            return null;
        }
    }

    private static Analysiser createHiveSqlAnalysiser()
    {
        return  new HiveSqlAnalysiser();
    }
}
