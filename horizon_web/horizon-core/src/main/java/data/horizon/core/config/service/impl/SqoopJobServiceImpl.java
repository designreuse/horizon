package data.horizon.core.config.service.impl;

import data.horizon.core.config.dao.SqoopJobDAO;
import data.horizon.core.config.model.SqoopJob;
import data.horizon.core.config.service.SqoopJobService;
import data.horizon.utils.LocalCacheUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Collections;
import java.util.List;

/**
 * Created by huyang on 2015/11/10.
 */

@Service
public class SqoopJobServiceImpl implements SqoopJobService{

    private static final String KEY = "SQOOPJOBS";

    private static LocalCacheUtil cache = LocalCacheUtil.getInstance();

    @Resource
    private SqoopJobDAO sqoopJobDAO;

    @Override
    public List<SqoopJob> list() {
        List<SqoopJob> sqoopJobs = (List<SqoopJob>)cache.get(KEY);
        if(sqoopJobs == null)
        {
            sqoopJobs = sqoopJobDAO.list();
            cache.put(KEY,sqoopJobs);
        }
        return sqoopJobs;
    }

    @Override
    public void update(SqoopJob sqoopJob) {
        sqoopJobDAO.update(sqoopJob);
        cache.remove(KEY);
    }

    @Override
    public void add(SqoopJob sqoopJob) {
        sqoopJobDAO.insert(sqoopJob);
        cache.remove(KEY);
    }
}
