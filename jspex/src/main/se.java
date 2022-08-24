package test;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class se extends Authenticator{
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {

		String eid = "eejsh08@naver.com";
		String epw = "VWMT24XBHPSM";
			return new PasswordAuthentication(eid, epw);
		}
	
}
