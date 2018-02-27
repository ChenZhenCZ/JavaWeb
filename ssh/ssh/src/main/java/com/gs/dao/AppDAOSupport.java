package com.gs.dao;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate5.support.HibernateDaoSupport;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/11/23.
 */
public class AppDAOSupport extends HibernateDaoSupport {

    @Resource(name = "sessionFactory")
    public void setAppSessionFactory(SessionFactory sessionFactory) {
        super.setSessionFactory(sessionFactory);
    }
}
