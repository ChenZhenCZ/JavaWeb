package com.cz.service.impl;

import com.cz.baen.Uers;
import com.cz.dao.UersDAO;
import com.cz.service.UersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UersServiceImpl implements UersService{
    @Autowired
    private UersDAO uersDAO;

    public Uers getByNamePwd(String name, String pwd) {
        return uersDAO.getByNamePwd(name,pwd);
    }
}
