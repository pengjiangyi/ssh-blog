package com.util;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.sun.mail.util.MailSSLSocketFactory;

public class MailUtil {
	
	
	
	
	public static void sendEmail(String receiver) throws MessagingException, GeneralSecurityException
	{
		Properties props = new Properties();
		// 开启debug调试
		props.setProperty("mail.debug", "true");
		// 发送服务器需要身份验证
		props.setProperty("mail.smtp.auth", "true");
		// 设置邮件服务器主机名
		props.setProperty("mail.smtp.host", "smtp.qq.com");
		// 发送邮件协议名称
		props.setProperty("mail.transport.protocol", "smtp");
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		props.put("mail.smtp.ssl.enable", "true");
		props.put("mail.smtp.ssl.socketFactory", sf);
		// ssl邮箱端口
		props.put("mail.smtp.socketFactory.port", 465);// 465
		Session session = Session.getInstance(props);
		Message msg = new MimeMessage(session);
		msg.setSubject("博客通知");
		StringBuilder builder = new StringBuilder();
		builder.append("博主回复了你的留言,请前去查看\n");
		builder.append("url:" + "www.pengjiangyi.com");
		Date date = new Date();
		SimpleDateFormat mat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		builder.append("\n时间" + mat.format(date));
		msg.setText(builder.toString());
		// msg.setFrom(new InternetAddress("java@pengjiangyi.com"));

		String nickname = "";
		try {
			nickname = javax.mail.internet.MimeUtility.encodeText("博主彭江毅");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		msg.setFrom(new InternetAddress(nickname + "<java@pengjiangyi.com>"));
		Transport transport = session.getTransport();
		transport.connect("smtp.qq.com", "java@pengjiangyi.com",
				"ckyihjoktxexbeeh");

		transport.sendMessage(msg, new Address[] { new InternetAddress(
				receiver) });
		transport.close();
		
		
	}
	
	
	
	public static void receiveEmail(String sendee,String text,String name,Session session) throws MessagingException, GeneralSecurityException
	{
		
		MimeMessage msg = new MimeMessage(session);
		msg.setSubject("博客联系");
		StringBuilder builder = new StringBuilder();
		builder.append(text);
		Date date = new Date();
		SimpleDateFormat mat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		builder.append("\n时间" + mat.format(date));
		msg.setText(builder.toString());
		// msg.setFrom(new InternetAddress("java@pengjiangyi.com"));

		String nickname = "";
		try {
			nickname = javax.mail.internet.MimeUtility.encodeText(name);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		msg.setFrom(new InternetAddress(nickname + "<"+sendee+">"));
	
		
	}
		
		
	

}
