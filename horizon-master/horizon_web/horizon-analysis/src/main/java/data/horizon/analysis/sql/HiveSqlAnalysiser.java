package data.horizon.analysis.sql;

import data.horizon.analysis.Analysiser;
import data.horizon.analysis.Plan;


import org.apache.hadoop.hive.conf.HiveConf;
import org.apache.hadoop.hive.ql.Context;
import org.apache.hadoop.hive.ql.metadata.HiveException;
import org.apache.hadoop.hive.ql.parse.*;
import org.apache.hadoop.hive.ql.session.SessionState;

import java.io.IOException;


/**
 * Created by huyang on 2015/12/23.
 */
public class HiveSqlAnalysiser implements Analysiser{

    private HiveConf conf;

    public Plan analysis(String hiveSql)
    {
        SqlPlan hiveSqlPlan = new HiveSqlPlan();
        try {
            conf = new HiveConf();
            hiveSqlPlan.setAst(parseAndAnalyze(hiveSql));
            return hiveSqlPlan;
        }catch (Exception e){
            return null;
        }
    }

    private ASTNode parseAndAnalyze(String query)
        throws IOException, ParseException, HiveException {

        SessionState.start(conf);
        Context ctx = new Context(conf);
        ctx.setCmd(query);
        ctx.setHDFSCleanup(true);

        ParseDriver pd = new ParseDriver();
        ASTNode tree = pd.parse(query, ctx);
        tree = ParseUtils.findRootNonNullToken(tree);

        return tree;
    }
}
