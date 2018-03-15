package com.cz.schdule;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class BuyJob implements Job {
    @Override
    public void execute(JobExecutionContext jobExecutionContext) throws JobExecutionException {
        JobDataMap jobDataMap=jobExecutionContext.getJobDetail().getJobDataMap();
        System.out.println("拿着"+jobDataMap.get("mony")+
                            "  去买"+jobDataMap.get("xxp"));
    }
}
