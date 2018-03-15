package com.cz.schdule;

import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

public class TimSchdule {

    public static void main(String[] ager){
        Timer timer =new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.println("学培 执行任务！");
                timer.cancel();
            }
        },3*1000);

        Calendar calendar= Calendar.getInstance();
        calendar.set(2018,3,14,15,15,30);
        Timer timer1 =new Timer();
        timer1.schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.println("扫黄 扫毒 扫厕所 哈哈哈！");
                timer1.cancel();
            }
        },calendar.getTime());
    }

}
