package com.cz.service;

import com.cz.baen.Permissions;

import java.util.List;

public interface PermissionsService {

    List<String> listPermissions(String uersname);

    List<Permissions> listByModule(Integer mid);
}
