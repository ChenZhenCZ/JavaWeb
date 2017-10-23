package com.cz.service.impl;

import com.cz.baen.Permissions;
import com.cz.dao.PermissionsDAO;
import com.cz.service.PermissionsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class PermissionsServiceImpl implements PermissionsService {

  @Autowired
  private PermissionsDAO permissionsDAO;

    public List<String> listPermissions(String uersname) {
        return permissionsDAO.listPermissions(uersname);
    }

    public List<Permissions> listByModule(Integer mid) {
        return permissionsDAO.listByModule(mid);
    }
}
