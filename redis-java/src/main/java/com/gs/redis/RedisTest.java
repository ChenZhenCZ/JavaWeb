package com.gs.redis;

import redis.clients.jedis.Jedis;

import java.util.HashMap;
import java.util.Map;

public class RedisTest {

    public static void main(String[] args) {
        Jedis jedis = new Jedis("localhost", 6379);
        jedis.set("s1", "string1");
        System.out.println(jedis.get("s1"));
        System.out.println(jedis.get("key_0"));
        Map<String, String> map = new HashMap<String, String>();
        map.put("s1", "string");
        jedis.hmset("hash_key_1", map);
        jedis.hget("hash_key_1", "s1");
        jedis.hset("hash_key_1", "s1", "new string");
        jedis.hlen("hash_key_1");
        jedis.hvals("hash_key_1");
        jedis.lpush("list_key_1", "list1", "list2", "list3");
        jedis.lpop("list_key_1");
        jedis.llen("list_key_1");
        jedis.lindex("list_key_1", 0);
        jedis.sadd("set_key_1", "member1", "member2");
        jedis.scard("set_key_1");
        jedis.zadd("zset_key_1", 100, "member1");
        jedis.zadd("zset_key_1", 200, "member2");

        jedis.keys("*");
        jedis.keys("*_key_*");
        jedis.exists("set_key_1");
        jedis.expire("set_key_1", 60);

        // 直接在指定的频道发布消息
        jedis.publish("channel1", "hello, subscribe");

        // jedis.save();
        jedis.bgsave();
        jedis.close();;
    }

}
