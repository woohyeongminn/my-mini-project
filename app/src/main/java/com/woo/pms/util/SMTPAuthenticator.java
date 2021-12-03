package com.woo.pms.util;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class SMTPAuthenticator extends Authenticator{
  PasswordAuthentication passwordAuthentication; 

  // 인증메일을 보낼 메일 주소와 비밀번호
  public SMTPAuthenticator() {
    String mail_id = "bit.study2@gmail.com";
    String mail_password = "bitcamp2@";

    passwordAuthentication = new PasswordAuthentication(mail_id, mail_password);
  }

  // 시스템에서 사용하는 인증 정보
  public PasswordAuthentication getPasswordAuthentication() {
    return passwordAuthentication;
  }
}
