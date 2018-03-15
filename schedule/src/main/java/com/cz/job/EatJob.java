package com.cz.job;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * @author xiaopeng
 * @date 2018/3/15 9:33
 */
@Component
public class EatJob {

    // cron只支持6个部分
    @Scheduled(cron = "0/5 * * * * ?")
    public void run() {
        System.out.println("快去吃饭啦……");
    }

}
