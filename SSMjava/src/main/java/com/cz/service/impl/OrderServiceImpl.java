package com.cz.service.impl;

import com.cz.bean.Order;

import com.cz.dao.OrderDAO;
import com.cz.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class OrderServiceImpl  implements OrderService{
    @Resource
    private OrderDAO orderDAO;

    public List<Order> listByUserId(Integer userId) {
        List list= orderDAO.listByUserId(userId);
             return list;
    }
}
