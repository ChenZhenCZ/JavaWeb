package com.gs.redis;

import redis.clients.jedis.JedisPubSub;

public class JedisPubSubImpl extends JedisPubSub {

    @Override
    public void onMessage(String channel, String message) {
        super.onMessage(channel, message);
        System.out.println(message);
    }

    @Override
    public void onSubscribe(String channel, int subscribedChannels) {
        super.onSubscribe(channel, subscribedChannels);
        System.out.println("已经订阅" + channel);
    }

    @Override
    public void onUnsubscribe(String channel, int subscribedChannels) {
        super.onUnsubscribe(channel, subscribedChannels);
        System.out.println("取消订阅" +  channel);
    }
}
