package com.cz.service;

import com.cz.bean.PageObject;
import com.cz.bean.Uers;

import java.util.List;

public interface UersService {
    void sava(Uers uers);
    Uers ById(String name);
    List<Uers> pageUerdList(PageObject page);

    public List<Uers> pageListUers();
}
