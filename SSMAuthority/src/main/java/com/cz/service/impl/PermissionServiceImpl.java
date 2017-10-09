package com.cz.service.impl;

import com.cz.bean.Permission;
import com.cz.dao.PermissionDAO;
import com.cz.service.PermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/9/25.
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Autowired
    private PermissionDAO permissionDAO;

    public Permission getByPermissionRole(List<Integer> roleIds, String permission) {
        return permissionDAO.getByPermissionRole(roleIds, permission);
    }
}
