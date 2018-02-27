package com.gs.dao.impl;

import com.gs.bean.Stu;
import com.gs.common.HibernateUtils;
import com.gs.common.Pager;
import com.gs.dao.AppDAOSupport;
import com.gs.dao.StuDAO;
import com.gs.vo.StuClassVO;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
@Repository
public class StuDAOImpl extends AppDAOSupport implements StuDAO {
    @Override
    public void save(Stu stu) {
        getHibernateTemplate().save(stu);
    }

    @Override
    public void remove(Stu stu) {
        getHibernateTemplate().delete(stu);
    }

    @Override
    public void removeById(Long id) {
        Stu stu = new Stu();
        stu.setId(id);
        getHibernateTemplate().delete(stu);
    }

    @Override
    public void update(Stu stu) {
        getHibernateTemplate().update(stu);
    }

    @Override
    public Stu getById(Long id) {
        return getHibernateTemplate().get(Stu.class, id);
    }

    @Override
    public List<Stu> listAll() {
        return getHibernateTemplate().loadAll(Stu.class);
    }

    @Override
    public Pager<Stu> listPager(Pager<Stu> pager) {
        return getHibernateTemplate().execute(new HibernateCallback<Pager<Stu>>() {
            @Override
            public Pager<Stu> doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from Stu");
                query.setFirstResult(pager.getBeginIndex());
                query.setMaxResults(pager.getPageSize());
                pager.setRows(query.list());
                return pager;
            }
        });
    }

    @Override
    public Long count() {
        return getHibernateTemplate().execute(new HibernateCallback<Long>() {
            @Override
            public Long doInHibernate(Session session) throws HibernateException {
                return (Long) session.createQuery("select count(id) from Stu").uniqueResult();
            }
        });
    }

    @Override
    public Pager<Stu> listPagerCriteria(Pager<Stu> pager, Stu stu) {
        return getHibernateTemplate().execute(new HibernateCallback<Pager<Stu>>() {
            @Override
            public Pager<Stu> doInHibernate(Session session) throws HibernateException {
                return HibernateUtils.pager(session, pager, stu, Stu.class);
            }
        });
    }

    @Override
    public Long countCriteria(Stu stu) {
        return getHibernateTemplate().execute(new HibernateCallback<Long>() {
            @Override
            public Long doInHibernate(Session session) throws HibernateException {
                return HibernateUtils.count(session, stu, Stu.class, null);
            }
        });
    }

    @Override
    public Pager<StuClassVO> listAllWithClass(Pager<StuClassVO> pager, Stu stu) {
        return getHibernateTemplate().execute(new HibernateCallback<Pager<StuClassVO>>() {
            @Override
            public Pager<StuClassVO> doInHibernate(Session session) throws HibernateException {
                String sql = "select s.id as id, s.num as num, s.real_name as realName," +
                        " c.title as className from t_stu s, t_class c where 1 = 1 and s.class_id = c.id";
                sql = HibernateUtils.buildCriteriaSQL(sql, stu) + " limit " + pager.getBeginIndex() + ", " + pager.getPageSize();
                Query query = session.createNativeQuery(sql);
                List<StuClassVO> stuClassVOList = HibernateUtils.buildBean(query.list(), new String[]{"id", "num", "realName", "className"}, StuClassVO.class);
                pager.setRows(stuClassVOList);
                return pager;
            }
        });
    }
}
