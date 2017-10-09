package com.cz.dao;

import com.cz.bean.PageObject;
import com.cz.bean.Uers;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface UersDAO {
    public void sava(Uers uers);

    public Uers ById(String name);

    public List<Uers> pageUerdList(PageObject page);

    public List<Uers> pageListUers();
}
