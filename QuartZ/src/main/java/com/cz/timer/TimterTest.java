package com.cz.timer;

import java.util.Calendar;
import java.util.Timer;
import java.util.TimerTask;

public class TimterTest  {
    public  static void main(String[] arg){
        Timer timer =new Timer();
        //定义时间
        Calendar calendar =Calendar.getInstance();
        calendar.set(2017,9,26,15,41,0);
        //作业区
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.println("启动");
            }
        },calendar.getTime());

        timer.cancel();//关闭

        Timer timer1 =new Timer();
        timer1.schedule(new TimerTask() {
            @Override
            public void run() {
                System.out.println("启动2");
            }
        },10*1000);

    }
}
