package com.cz.service;

import com.cz.bean.Order;

import java.util.List;

public interface OrderService {
    List<Order> listByUserId(Integer userId);
}
