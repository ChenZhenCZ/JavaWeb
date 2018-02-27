package com.gs.service.impl;

import com.gs.bean.Stu;
import com.gs.common.Pager;
import com.gs.dao.StuDAO;
import com.gs.service.StuService;
import com.gs.vo.StuClassVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/11/21.
 */
@Service
public class StuServiceImpl implements StuService {

    @Autowired
    private StuDAO stuDAO;

    @Override
    public void save(Stu stu) {
        stuDAO.save(stu);
    }

    @Override
    public void remove(Stu stu) {
        stuDAO.remove(stu);
    }

    @Override
    public void removeById(Long id) {
        stuDAO.removeById(id);
    }

    @Override
    public void update(Stu stu) {
        stuDAO.update(stu);
    }

    @Override
    public Stu getById(Long id) {
        return stuDAO.getById(id);
    }

    @Override
    public List<Stu> listAll() {
        return stuDAO.listAll();
    }

    @Override
    public Pager<Stu> listPager(int pageNo, int pageSize) {
        Pager<Stu> pager = new Pager<Stu>(pageNo, pageSize);
        pager = stuDAO.listPager(pager);
        pager.setTotal(stuDAO.count());
        return pager;
    }

    @Override
    public Pager<Stu> listPagerCriteria(int pageNo, int pageSize, Stu stu) {
        Pager<Stu> pager = new Pager<>(pageNo, pageSize);
        pager.setTotal(stuDAO.countCriteria(stu));
        return stuDAO.listPagerCriteria(pager, stu);
    }

    @Override
    public Pager<StuClassVO> listAllWithClass(int pageNo, int pageSize, Stu stu) {
        Pager<StuClassVO> pager = new Pager<>(pageNo, pageSize);
        pager = stuDAO.listAllWithClass(pager, stu);
        pager.setTotal(2L);
        return pager;
    }
}
