package com.gs.redis;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import redis.clients.jedis.JedisPoolConfig;

public class RedisPoolTest {

    public static void main(String[] args) {
        JedisPoolConfig jedisPoolConfig = new JedisPoolConfig();
        jedisPoolConfig.setMaxTotal(50);
        jedisPoolConfig.setMaxIdle(5);
        jedisPoolConfig.setTestWhileIdle(true);
        JedisPool jedisPool = new JedisPool(jedisPoolConfig, "127.0.0.1", 6379, 10 * 1000);
        Jedis jedis = jedisPool.getResource();
        System.out.println(jedis.get("s1"));
        // 开始订阅指定的频道，需要自己实现一个发布订阅的事件监听器
        jedis.subscribe(new JedisPubSubImpl(), "channel1");
        jedis.close();
    }

}
