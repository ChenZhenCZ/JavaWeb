package com.wd.common;

public class SendMail {
	public  void sendMail(MailSenderInfo mailInfo) {
	  // 发送邮件
	  SimpleMailSender sms = new SimpleMailSender();
	  // 发送文体格式
	  sms.sendTextMail(mailInfo);
	  System.out.println("邮件发送完毕");
	}
	public  void SendAllMail(MailSenderInfo mailInfo) {
		  // 发送邮件
		  SimpleMailSender sms = new SimpleMailSender();
		  // 发送文体格式
		  sms.sendAllMail(mailInfo);
		  System.out.println("邮件发送完毕");
		}
	
	public static void main(String[] args) {
		MailSenderInfo info=new MailSenderInfo();
		//群发
//		String[] address={"1945214998@qq.com","1471244691@qq.com"};群发地址
//		info.setAddress(address);
//		info.setSubject("测试");邮件标题
//		info.setContent("邮箱测试");邮件内容
//		new SendMail().SendAllMail(info);发送方式
		//---------------------------------------------------
		//单个发送
		info.setToAddress("1471244691@qq.com");
		info.setSubject("测试");
		info.setContent("邮箱测试");
		new SendMail().sendMail(info);
	}
}
