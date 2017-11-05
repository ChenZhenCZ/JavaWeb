package quartz;

import org.quartz.*;
import org.quartz.impl.StdSchedulerFactory;

public class QuartzTest {
    /**
     *
     * @param arge
     */
    public static void main(String[] arge){
        try {
            Scheduler scheduler= StdSchedulerFactory.getDefaultScheduler();
            JobDetail jobDetail= JobBuilder.newJob(HollJob.class).withIdentity("holl").build();
            Trigger trigger=TriggerBuilder.newTrigger().withIdentity("trigger","holl")
                    .withSchedule(SimpleScheduleBuilder.simpleSchedule().withIntervalInSeconds(2).withRepeatCount(5)).build();
            scheduler.start();//启动
            //每个月的26号19点50分0秒每10秒运行一次
            JobDetail jobDetail11 = JobBuilder.newJob(Test.class).withIdentity("test").build();
            Trigger trigger1=TriggerBuilder.newTrigger().withIdentity("trigger1","test")
                    .withSchedule(CronScheduleBuilder.cronSchedule("0/10 50 19 26 * ? *")).build();

            scheduler.scheduleJob(jobDetail,trigger);
            scheduler.scheduleJob(jobDetail11,trigger1);
            scheduler.clear();//结束
        } catch (SchedulerException e) {
            e.printStackTrace();
        }
    }
}
