package com.cz.service.impl;


import com.cz.bean.User;
import com.cz.common.Pager;
import com.cz.dao.UserDAO;
import com.cz.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAO userDAO;
    @Autowired
    private RedisTemplate redisTemplate;

    @Override
    public void save(Object obj) {

    }

    @Override
    public void remove(Object obj) {

    }

    @Override
    public void removeById(Long id) {

    }

    @Override
    public void update(Object obj) {

    }

    @Override
    public Object getById(Long id) {
        // 第一步，从缓存中拿数据
        ValueOperations<String, User> valueOperations = redisTemplate.opsForValue();
        User user = valueOperations.get("user-" + id);
        // 如果缓存中有数据，则直接返回结果
        if (user != null) {
            return user;
        } else {
            // 如果缓存中没有数据，则先去数据库中查找数据，然后缓存到缓存中，再返回结果
            Object obj = userDAO.getById(id);
            if (obj != null){
                valueOperations.set("user-" + id, (User) obj);
            }
            return obj;
        }
    }

    @Override
    public List<Object> listAll() {
        return null;
    }

    @Override
    public Pager listPager(int pageNo, int pageSize) {
        return null;
    }

    @Override
    public Pager listPagerCriteria(int pageNo, int pageSize, Object obj) {
        return null;
    }
}
