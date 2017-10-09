package com.cz.service;

import com.cz.bean.Order;
import com.cz.bean.OrderItem;
import com.cz.bean.Product;
import com.cz.bean.User;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;
import java.util.List;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(value = {"classpath:/config/spring-context.xml",
                              "classpath:/config/spring-mybatis.xml"})
public class OrderServiceTest {
    @Resource
    private  OrderService orderService;

    @Test
    public  void testListByUserId(){
        List<Order> orderList = orderService.listByUserId(1);
        for (Order order: orderList){
            System.out.println(order.getOrder_time());
            User user=order.getUser();
            System.out.println(user.getName());
            List<OrderItem> orderItemList =order.getOrderItem();
            for (OrderItem Item:orderItemList ){
                System.out.println(Item.getId()+";"+Item.getTotalCost());
                Product product=Item.getProduct();
                System.out.println(product.getTitle());
            }
        }
    }
}
