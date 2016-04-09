package data.horizon.core.config.dao;

import data.horizon.core.config.model.SqoopJob;

import java.util.List;

/**
 * Created by huyang on 2015/11/10.
 */
public interface SqoopJobDAO {
    public List<SqoopJob> list();
    public void update(SqoopJob sqoopJob);
    public void insert(SqoopJob sqoopJob);
}
