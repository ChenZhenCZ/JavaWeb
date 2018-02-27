package com.gs.dao.impl;

import com.gs.bean.Contract;
import com.gs.common.HibernateUtils;
import com.gs.common.Pager;
import com.gs.dao.AppDAOSupport;
import com.gs.dao.ContractDAO;
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
public class ContractDAOImpl extends AppDAOSupport implements ContractDAO {
    @Override
    public void save(Contract contract) {
        getHibernateTemplate().save(contract);
    }

    @Override
    public void remove(Contract contract) {
        getHibernateTemplate().delete(contract);
    }

    @Override
    public void removeById(Long id) {
        Contract contract = new Contract();
        contract.setId(id);
        getHibernateTemplate().delete(contract);
    }

    @Override
    public void update(Contract contract) {
        getHibernateTemplate().update(contract);
    }

    @Override
    public Contract getById(Long id) {
        return getHibernateTemplate().get(Contract.class, id);
    }

    @Override
    public List<Contract> listAll() {
        return getHibernateTemplate().loadAll(Contract.class);
    }

    @Override
    public Pager<Contract> listPager(Pager<Contract> pager) {
        return getHibernateTemplate().execute(new HibernateCallback<Pager<Contract>>() {
            @Override
            public Pager<Contract> doInHibernate(Session session) throws HibernateException {
                Query query = session.createQuery("from Contract");
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
                return (Long) session.createQuery("select count(id) from Contract").uniqueResult();
            }
        });
    }

    @Override
    public Pager<Contract> listPagerCriteria(Pager<Contract> pager, Contract contract) {
        return getHibernateTemplate().execute(new HibernateCallback<Pager<Contract>>() {
            @Override
            public Pager<Contract> doInHibernate(Session session) throws HibernateException {
                return HibernateUtils.pager(session, pager, contract, Contract.class);
            }
        });
    }

    @Override
    public Long countCriteria(Contract contract) {
        return getHibernateTemplate().execute(new HibernateCallback<Long>() {
            @Override
            public Long doInHibernate(Session session) throws HibernateException {
                return HibernateUtils.count(session, contract, Contract.class, null);
            }
        });
    }

}
