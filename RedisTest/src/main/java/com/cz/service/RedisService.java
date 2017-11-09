package com.cz.service;

import com.cz.bean.Uers;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.ListOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RedisService {

    @Autowired
    private RedisTemplate redisTemplate;

    public String getById(String id){
        ValueOperations<String,String> valueOperations = redisTemplate.opsForValue();
        String value = valueOperations.get(id);
        if(value!=null){
            System.out.println("从缓存中拿数据！");
            return value;
        }else {
            // 去数据库里拿
            String va="tese1";
            valueOperations.set(id,va);
            return va;
        }

    }

    public List<Uers> listAll(){
        ListOperations<String,Uers> listOperations = redisTemplate.opsForList();
        List<Uers> list = listOperations.range("list_uers", 0, 20);

        if(list!=null && list.size()>0){
            System.out.println("从缓存中拿数据！");
            return list;
        }else {
            List<Uers>  LsitUers =new ArrayList<Uers>();
            LsitUers.add(new Uers());
            listOperations.leftPushAll("list_uers",LsitUers);
            return LsitUers;
        }

    }
}
