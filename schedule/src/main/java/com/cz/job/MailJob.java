package com.cz.job;

import org.springframework.stereotype.Component;

@Component
public class MailJob {

    public void run(){
        System.out.println("发送邮件。。。。");
    }
}
