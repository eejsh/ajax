package test;
import javax.mail.*;

public class smtp extends Authenticator {
	
	public PasswordAuthentication getPasswordAuthentication() {
		
		String username ="eejsh08@naver.com";
		String password = "VWMT24XBHPSM";

		return new PasswordAuthentication(username, password);
		
		
	}
	
	
	
}
