package com.cz.mail;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class MailUiltsApi {

    public static  void sendMail(Mail mail){
        Properties porperties =MainUtils.duid("src/main/resources/mail.properties");
        Session session= Session.getInstance(porperties,
                new MailAuthenticator(MainUtils.getString("username"),
                MainUtils.getString("password")));
        mail.setFrom(MainUtils.getString("username"));

        try {
            Message message =new MimeMessage(session);
            message.setSubject(mail.getSubject());//主题
            message.setFrom(mail.getFrom());//邮件发送者
            if(mail.getContent()!=null) {
                message.setContent(mail.getContent(), mail.getContentType());//内容1，类型2
            }else {
                Multipart multipart = new MimeMultipart();
                BodyPart  bodyPart  = new  MimeBodyPart();
                bodyPart.setContent(mail.getBodycontent(),mail.getContentType());
                multipart.addBodyPart(bodyPart);
                for (String path:mail.getAttachments()){
                    System.out.println(path);
                    BodyPart filePath=new MimeBodyPart();
                    filePath.setDataHandler(new DataHandler(new FileDataSource(path)));
                    multipart.addBodyPart(filePath);
                }
                message.setContent(multipart);
            }

            message.setRecipients(Message.RecipientType.TO, mail.getTo());
            message.setRecipients(Message.RecipientType.CC, mail.getCc());
            message.setRecipients(Message.RecipientType.BCC, mail.getBcc());

            Transport transport = session.getTransport();
            transport.connect();
            transport.sendMessage(message, message.getAllRecipients());

        } catch (MessagingException e) {
            e.printStackTrace();
        }


    }
    public static void main(String[] args) {

        new Thread(new Runnable() {
            public void run() {
                Mail mail = new Mail();
                mail.setSubject("放假啦");
              //  mail.setContent("8天<a href='http://baidu.com'>进入网站</a>" +
                //"<img src='http://b.hiphotos.baidu.com/zhidao/pic/item/a5c27d1ed21b0ef47a3cc0a7dbc451da80cb3e76.jpg' />");
                mail.setBodycontent("我来了");
                mail.setContentType("text/html;charset=utf-8");
                List<String> aut=new ArrayList<String>();
                aut.add("src/main/resources/mail.properties");
                aut.add("src/main/resources/baiduditu.html");
                mail.setAttachments(aut);
                mail.setTo("2908903432@qq.com");
                mail.setCc("2908903432@qq.com");
                mail.setBcc("2908903432@qq.com");
                MailUiltsApi.sendMail(mail);
            }
        }).start();
    }

}
