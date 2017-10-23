package com.cz.service.impl;

import com.cz.baen.Role;
import com.cz.dao.RoleDAO;
import com.cz.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;
@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleDAO roleDAO;

    public List<Role> list() {

        return roleDAO.list();
    }

    public List<String> listRoles(String uersname) {
        return roleDAO.listRoles(uersname);
    }
}
