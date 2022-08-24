package test;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class se extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {

		String eid = "aa@naver.com";
		String epw = "aa";
			return new PasswordAuthentication(eid, epw);
		}
	
}
