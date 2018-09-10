package net.utility;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
  //사용하고자 하는 메일 서버에서 인증받은 계정과 비번 관련 클래스 생성
  private PasswordAuthentication pa;

  public MyAuthenticator() { //생성자 함수
    pa = new PasswordAuthentication("soldesk@pretyimo.cafe24.com", "soldesk6901");
  }

  @Override
  protected PasswordAuthentication getPasswordAuthentication() {
    return pa;
  }

}//class end