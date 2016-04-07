package data.horizon.analysis.sql;

import data.horizon.analysis.Plan;
import data.horizon.analysis.Visitor;
import org.antlr.runtime.tree.CommonTree;

/**
 * Created by huyang on 2015/12/23.
 */
public abstract class SqlPlan implements Plan {
  protected CommonTree ast;

  public CommonTree getAst() {
    return ast;
  }

  public void setAst(CommonTree ast) {
    this.ast = ast;
  }

  @Override
  public abstract void accept(Visitor visitor);
}
