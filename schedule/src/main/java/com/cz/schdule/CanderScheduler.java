package com.cz.schdule;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

public class CanderScheduler {
    public static void main(String[] arge){
        try {
            Scheduler scheduler= StdSchedulerFactory.getDefaultScheduler();
            JobDataMap dataMap=new JobDataMap();
            dataMap.put("mony",100.0);
            dataMap.put("xxp","谢学培");
            JobDetail jobDetail= JobBuilder.newJob(BuyJob.class)
                    .withIdentity("buyjob","buy_grud")
                    .setJobData(dataMap)
                    .build();
            Trigger trigger=TriggerBuilder.newTrigger()
                    .withIdentity("trigger","buy_ger")
                    .withSchedule(CronScheduleBuilder.cronSchedule("0/5 0-50 11-12 * * ? *"))
                    .build();
            scheduler.start();
            scheduler.scheduleJob(jobDetail,trigger);


        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }
}
