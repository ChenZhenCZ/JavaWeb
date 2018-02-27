package com.gs.service;

import com.gs.bean.Clazz;
import com.gs.bean.Stu;
import com.gs.bean.StuDetail;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by Administrator on 2017/11/22.
 */
public class StuServiceTest extends BaseTest {

    @Autowired
    private StuService stuService;

    @Test
    public void testSave() {
        Stu stu = new Stu();
        Clazz clazz = new Clazz();
        clazz.setId(1L);
        stu.setClazz(clazz);
        stu.setNum("160108");
        stu.setRealName("张三");

        StuDetail stuDetail = new StuDetail();
        stuDetail.setGender((byte) 0);
        stuDetail.setIdentityNo("188");
        stuDetail.setPhone("18888888888");
        stuDetail.setStu(stu);
        stu.setStuDetail(stuDetail);

        stuService.save(stu);
    }

    @Test
    public void testGetById() {
        Stu stu = stuService.getById(10L);
        System.out.println(stu.getStuDetail().getPhone());
    }

}
