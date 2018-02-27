package com.gs.service;

import com.gs.bean.Clazz;
import com.gs.bean.Stu;
import com.gs.common.Pager;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Set;

/**
 * Created by Administrator on 2017/11/22.
 */
public class ClazzServiceTest extends BaseTest {

    @Autowired
    private ClazzService clazzService;

    @Test
    public void testSave() {
        Clazz clazz = new Clazz();
        clazz.setTitle("1606");
        Set<Stu> stuSet = new HashSet<>();
        Stu stu = new Stu();
        stu.setNum("160601");
        stu.setRealName("AA");
        stuSet.add(stu);
        clazz.setStuSet(stuSet);
        clazzService.save(clazz);
    }

    @Test
    public void testGetById() {
        Clazz clazz = clazzService.getById(1L);
        System.out.println(clazz.getTitle());
        Set<Stu> stuSet = clazz.getStuSet();
        System.out.println(stuSet.iterator().next().getRealName());
    }

    @Test
    public void testListPager() {
        Pager<Clazz> pager = clazzService.listPager(1, 2);
        System.out.println(pager.getTotal());
        System.out.println(pager.getPages());
        System.out.println(pager.getRows().get(0).getTitle());
    }

}
