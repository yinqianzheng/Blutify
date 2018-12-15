package com.blue.configuration;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class BlueEmail {
	
	final String username = "blutify308@gmail.com";
    final String password = "bluecse308";
    Properties props;
    Session session;
    MimeMessage message;
    
	public BlueEmail() {
		this.props = new Properties();
	    this.props.put("mail.smtp.auth", "true");
	    this.props.put("mail.smtp.starttls.enable", "true");
	    this.props.put("mail.smtp.host", "smtp.gmail.com");
	    this.props.put("mail.smtp.port", "587");
	    
	    this.session = Session.getInstance(props,
	  	      new javax.mail.Authenticator() {
	  	        protected PasswordAuthentication getPasswordAuthentication() {
	  	            return new PasswordAuthentication(username, password);
	  	        }
	  	      });
	}
	
	public void setEmail(String subject, String to, String text) {
		try {

	        message = new MimeMessage(session);
	        this.message.setFrom(new InternetAddress("blutify308@gmail.com"));
	        this.message.setRecipients(Message.RecipientType.TO,
	            InternetAddress.parse(to));
	        this.message.setSubject(subject);
	        this.message.setText(text);
	    } catch (MessagingException e) {
	        throw new RuntimeException(e);
	    }
	}
	
	public void send() {
		try {
			Transport.send(this.message);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}


}
