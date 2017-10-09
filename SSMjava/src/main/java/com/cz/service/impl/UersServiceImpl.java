package com.cz.service.impl;

import com.cz.bean.PageObject;
import com.cz.bean.Uers;
import com.cz.dao.UersDAO;
import com.cz.service.UersService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.sql.CommonDataSource;
import java.util.List;

@Service
public class UersServiceImpl implements UersService {
    /**
     * @Resource此注解默认按照名称注入，如果没有名称，再按照类型注入
     *
     * @Autowired注解默认按类型注入
     *
     * 如果把注解放在属性上，则破坏了类的封装性，因为使用了Java反射，没有用set方法
     */
    @Resource
    private UersDAO uersDAO;

    @Resource
    private CommonDataSource commonDataSource;

    public void sava(Uers uers) {
        uersDAO.sava(uers);
    }

    public Uers ById(String name) {

        return uersDAO.ById(name);
    }
    //分页
    public List<Uers> pageUerdList(PageObject page) {
        return uersDAO.pageUerdList(page);
    }

    public List<Uers> pageListUers() {

        return uersDAO.pageListUers();
    }
}
