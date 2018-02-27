package com.gs.dao.impl;

import com.gs.bean.Contract;
import com.gs.bean.Teacher;
import com.gs.common.HibernateUtils;
import com.gs.common.Pager;
import com.gs.dao.AppDAOSupport;
import com.gs.dao.TeacherDAO;
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
public class TeacherDAOImpl extends AppDAOSupport implements TeacherDAO {
    @Override
    public void save(Teacher teacher) {
        getHibernateTemplate().save(teacher);
    }

    @Override
    public void remove(Teacher teacher) {
        getHibernateTemplate().delete(teacher);
    }

    @Override
    public void removeById(Long id) {
        Teacher teacher = new Teacher();
        teacher.setId(id);
        getHibernateTemplate().delete(teacher);
    }

    @Override
    public void update(Teacher teacher) {
        getHibernateTemplate().update(teacher);
    }

    @Override
    public Teacher getById(Long id) {
        return getHibernateTemplate().get(Teacher.class, id);
    }

    @Override
    public List<Teacher> listAll() {
        return getHibernateTemplate().loadAll(Teacher.class);
    }

    @Override
    public Pager<Teacher> listPager(Pager<Teacher> pager) {
        return getHibernateTemplate().execute(new HibernateCallback<Pager<Teacher>>() {
            @Override
            public Pager<Teacher> doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from Teacher");
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
                return (Long) session.createQuery("select count(id) from Teacher").uniqueResult();
            }
        });
    }

    @Override
    public Pager<Teacher> listPagerCriteria(Pager<Teacher> pager, Teacher teacher) {
        return getHibernateTemplate().execute(new HibernateCallback<Pager<Teacher>>() {
            @Override
            public Pager<Teacher> doInHibernate(Session session) throws HibernateException {
                return HibernateUtils.pager(session, pager, teacher, Teacher.class);
            }
        });
    }

    @Override
    public Long countCriteria(Teacher teacher) {
        return getHibernateTemplate().execute(new HibernateCallback<Long>() {
            @Override
            public Long doInHibernate(Session session) throws HibernateException {
                return HibernateUtils.count(session, teacher, Teacher.class, null);
            }
        });
    }

    @Override
    public void saveClasses(Long teacherId, List<Long> classIds) {
        getHibernateTemplate().execute(new HibernateCallback<Object>() {
            @Override
            public Object doInHibernate(Session session) throws HibernateException {
                for (Long classId : classIds) {
                    Query query = session.createNativeQuery("insert into t_class_teacher(class_id, teacher_id) values (:classId, :teacherId)");
                    query.setParameter("classId", classId);
                    query.setParameter("teacherId", teacherId);
                    query.executeUpdate();
                }
                return null;
            }
        });
    }

}
