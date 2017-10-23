package com.cz.dao;

import com.cz.baen.Module;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ModuleDAO {

    List<Module> list();
}
