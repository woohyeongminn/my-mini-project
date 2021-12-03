package com.woo.pms.util;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendMail {

  public void sendMail(String mail, String password) {
    Properties props = System.getProperties();

    try {
      props.put("mail.smtp.starttls.enable", "true"); // 로그인시 TLS를 사용할 것인지 설정
      props.put("mail.smtp.host", "smtp.gmail.com"); // 이메일 발송을 처리할 smtp 서버
      props.put("mail.smtp.auth", "true"); // SMTP 서버의 인증을 사용한다는 의미
      props.put("mail.smtp.port", "587"); // TLS 포트번호 : 587

      // Could not convert socket to TLS 오류떠서 추가한 코드
      props.put("mail.smtp.ssl.trust", "smtp.gmail.com"); 
      props.put("mail.smtp.ssl.protocols", "TLSv1.2");

      // 인증정보, 세션, 메일 메세지 설정
      Authenticator auth = new SMTPAuthenticator();
      Session mailSession = Session.getDefaultInstance(props, auth);
      MimeMessage mailMessage = new MimeMessage(mailSession);

      mailMessage.setSentDate(new Date(System.currentTimeMillis())); // 보내는 날짜 지정
      mailMessage.setFrom(new InternetAddress("bit.study2@gmail.com", "오늘의 공부 관리자")); // 발송자 메일, 발송자 이름
      InternetAddress to = new InternetAddress(mail); // 수신자 설정
      mailMessage.setRecipient(Message.RecipientType.TO, to);
      mailMessage.setSubject("오늘의 공부 - 임시 비밀번호 발급", "UTF-8");
      mailMessage.setText("임시 비밀번호 : " + password, "UTF-8");

      Transport.send(mailMessage); // 메일 보내기

    } catch(AddressException e) {            
      System.out.println("AddressException : " + e.getMessage());
      e.printStackTrace();
    } catch(MessagingException e) {            
      System.out.println("MessagingException : " + e.getMessage());
      e.printStackTrace();
    } catch(UnsupportedEncodingException e) {
      System.out.println("UnsupportedEncodingException : " + e.getMessage());
      e.printStackTrace();
    }

  }
}








