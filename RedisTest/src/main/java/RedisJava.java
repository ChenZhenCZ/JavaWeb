import redis.clients.jedis.Jedis;

import java.util.List;
import java.util.Set;

public class RedisJava {

    public static void main(String[] ager) throws InterruptedException {
        Jedis jedis=new Jedis("127.0.0.1",6379,6000);
        System.out.println("连接成功！");
        System.out.println("服务正在运行.."+jedis.ping());
        jedis.set("key_value","value1");
        System.out.println(jedis.get("key_value"));

        if (jedis.exists("lpush")){
            jedis.del("lpush");
        }
        jedis.lpush("lpush","test1","test2","test3");
        List<String> lpush = jedis.lrange("lpush", 0, 20);
        for(String s:lpush){
            System.out.println(s);
        }

        jedis.sadd("sadd","1","2","3");
        Set<String> sadd = jedis.smembers("sadd");

        for (String s:sadd){
            System.out.println(s);
        }

        jedis.zadd("zset_key", 1, "zset1");
        jedis.zadd("zset_key", 2, "zset2");
        jedis.zadd("zset_key", 0, "zset3");
        Set<String> zset = jedis.zrange("zset_key", 0, 10);
        System.out.println("zset……");
        for (String s : zset) {
            System.out.println(s);
        }
        jedis.hset("hash_key", "field1", "value1");
        jedis.hset("hash_key", "field2", "value2");
        System.out.println(jedis.hget("hash_key", "field2"));
        System.out.println("hash……");
        List<String> hashValues = jedis.hmget("hash_key", "field1", "field2");
        for (String s : hashValues) {
            System.out.println(s);
        }

        jedis.set("key1", "value1");
        jedis.expire("key1", 5);
        Thread.sleep(6 * 1000);
        if (!jedis.exists("key1")) {
            System.out.println("已失效");
        }
    }
}
