package com.gs.redis;

import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

public class RedisClusterTest {

    private static final String[] CLUSTERS = {
            "127.0.0.1:6380",
            "127.0.0.1:6381",
            "127.0.0.1:6382",
            "127.0.0.1:6383",
            "127.0.0.1:6384",
            "127.0.0.1:6385"
    };

    public static void main(String[] args) throws IOException {
        Set<HostAndPort> jedisClusterNodes = new HashSet<>();
        for (String cluster : CLUSTERS) {
            String[] clusterInfo = cluster.split(":");
            jedisClusterNodes.add(new HostAndPort(clusterInfo[0], Integer.valueOf(clusterInfo[1])));
        }
        JedisCluster jedisCluster = new JedisCluster(jedisClusterNodes);
        jedisCluster.set("foo", "bar");
        System.out.println(jedisCluster.get("foo"));
        System.out.println(jedisCluster.get("key1"));
        jedisCluster.close();
    }

}
