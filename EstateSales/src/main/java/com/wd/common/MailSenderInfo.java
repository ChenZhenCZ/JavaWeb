package com.wd.common;

import java.util.Properties;

public class MailSenderInfo {
	 // 发送邮件的服务器的IP(或主机地址)
	 private String mailServerHost="smtp.163.com";
	 // 发送邮件的服务器的端口
	 private String mailServerPort = "25";
	 // 发件人邮箱地址
	 private String fromAddress;
	 // 单个收件人邮箱地址
	 private String toAddress;
	 //群发收件人
	 private String[] Address;
	 // 登陆邮件发送服务器的用户名
	 private String userName;
	 // 登陆邮件发送服务器的密码
	 private String password;
	 // 是否需要身份验证
	 private boolean validate = true;
	 // 邮件主题
	 private String subject;
	 // 邮件的文本内容
	 private String content;
	 // 邮件附件的文件名
	 private String[] attachFileNames;
	 
	 public Properties getProperties() {
	  Properties p = new Properties();
	  p.put("mail.smtp.host", this.mailServerHost);
	  p.put("mail.smtp.port", this.mailServerPort);
	  p.put("mail.smtp.auth", validate ? "true" : "false");
	  return p;
	 }
	 public String getMailServerHost() {
		 String mailServerHost="smtp.163.com";
		 return mailServerHost;
	 }
	 public String getMailServerPort() {
		 String port="25";
		 return port;
	 }
	 public boolean isValidate() {
	  return validate;
	 }
	 public void setValidate(boolean validate) {
	  this.validate = validate;
	 }
	 public String[] getAttachFileNames() {
	  return attachFileNames;
	 }
	 public void setAttachFileNames(String[] fileNames) {
	  this.attachFileNames = fileNames;
	 }
	 public String getFromAddress() {
		 String fromAddress="WebLinHui@163.com";
		 return fromAddress;
	 }
	 public String getPassword() {
		 String password="llh147235";
		 return password;
	 }
	 public String getToAddress() {
	  return toAddress;
	 }
	 public void setToAddress(String toAddress) {
	  this.toAddress = toAddress;
	 }
	 public String getUserName() {
		 String userName="WebLinHui@163.com";
		 return userName;
	 }
	 public String getSubject() {
	  return subject;
	 }
	 public void setSubject(String subject) {
	  this.subject = subject;
	 }
	 public String getContent() {
	  return content;
	 }
	 public void setContent(String textContent) {
	  this.content = textContent;
	 }
	public String[] getAddress() {
		return Address;
	}
	public void setAddress(String[] address) {
		Address = address;
	}
}
