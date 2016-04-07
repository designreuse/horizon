package data.horizon.analysis;

/**
 * Created by huyang on 2015/12/23.
 */
public interface Plan {
    void accept(Visitor visitor);
}
