package data.horizon.analysis.sql;

import data.horizon.analysis.Plan;
import data.horizon.analysis.Visitor;


/**
 * Created by huyang on 2015/12/23.
 */
public class HiveSqlPlan extends SqlPlan implements Plan {

    @Override
    public void accept(Visitor visitor) {
        visitor.visit(this.ast);
    }
}
