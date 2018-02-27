package com.gs.service;

import com.gs.bean.Stu;
import com.gs.common.HibernateUtils;
import org.junit.Test;

/**
 * Created by Administrator on 2017/11/29.
 */
public class HibernateUtilsTest {
    @Test
    public void testColumnToProperty() {
        System.out.println(HibernateUtils.columnToProperty("is_active"));
        System.out.println(HibernateUtils.propertyToColumn("isCustomerInfoDelete"));
        Stu stu = new Stu();
        stu.setNum("1");
        System.out.println(HibernateUtils.buildCriteriaSQL("select s.id as id, s.num as num, s.real_name as realName," +
                " c.title as className from t_stu s, t_class c where 1 = 1 and s.class_id = c.id", stu) + " limit 1, 5");
    }
}
