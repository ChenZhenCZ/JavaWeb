package com.cz.service;

import com.cz.baen.Role;

import java.util.List;

public interface RoleService {
    List<Role> list();

    List<String> listRoles(String uersname);
}
