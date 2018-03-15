package com.cz.schdule;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

public class HelloScheduler {

    public static void main(String[] arge){

        try {
            Scheduler scheduler= StdSchedulerFactory.getDefaultScheduler();
            //触发器
            JobDetail jobDetail= JobBuilder.newJob(HelloJob.class)
                    .withIdentity("hellojob","job_group")
                    .build();
            //调度器
            Trigger trigger=TriggerBuilder.newTrigger()
                    .withIdentity("triggerhell","trigger_group").withSchedule(SimpleScheduleBuilder.repeatSecondlyForever(3))
                    .build();
            scheduler.start();
            //绑定
            scheduler.scheduleJob(jobDetail, trigger);
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }
}
