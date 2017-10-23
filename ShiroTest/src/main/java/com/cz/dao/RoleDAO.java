package com.cz.dao;

import com.cz.baen.Role;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RoleDAO {
    List<Role> list();
    List<String> listRoles(String uersname);
}
