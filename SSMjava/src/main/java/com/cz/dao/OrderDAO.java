package com.cz.dao;

import com.cz.bean.Order;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderDAO {
    List<Order> listByUserId(Integer userId);
}
