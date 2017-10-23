package com.cz.dao;

import com.cz.baen.Permissions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PermissionsDAO {

    List<String> listPermissions(String uersname);

    List<Permissions> listByModule(Integer mid);
}
