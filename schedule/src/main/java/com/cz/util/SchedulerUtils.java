package com.cz.util;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

/**
 * @author xiaopeng
 * @date 2018/3/15 8:56
 */
public class SchedulerUtils {

    public static void modify(String jobName, String jobGroup, String triggerName, String triggerGroup, String cronExp) {
        try {
            Scheduler scheduler = StdSchedulerFactory.getDefaultScheduler();
            JobDetail jobDetail = scheduler.getJobDetail(new JobKey(jobName, jobGroup));
            TriggerKey triggerKey = new TriggerKey(triggerName, triggerGroup);
            Trigger trigger = scheduler.getTrigger(triggerKey);
            TriggerBuilder triggerBuilder = trigger.getTriggerBuilder();
            // 修改触发器的cron表达式
            triggerBuilder.withSchedule(CronScheduleBuilder.cronSchedule(cronExp));
            // 停止调度触发器对应的作业
            scheduler.unscheduleJob(triggerKey);
            scheduler.scheduleJob(jobDetail, triggerBuilder.build());
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }


}
