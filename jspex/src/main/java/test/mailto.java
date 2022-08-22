package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class mailto extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public mailto() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	//properties, map : 같은 속성임  (열거형: 키값이 잇는 배열)
		
	Properties prop = new Properties();

	prop.put("mail.smtp.host","smtp.naver.com"); 
	prop.put("mail.smtp.port","587"); 
	prop.put("defaultEncoding","utf-8"); 
	prop.put("mail.smtp.auth","true");
	
//	prop.put("host", "smtp.naver.com");  //smtp.gmail.com
//	prop.put("port", "587");
//	prop.put("ssl","true");
//	prop.put("auth", "true");
//	prop.put("trust", "smtp.naver.com");
	
//	prop.put("mail.smtp.host", "smtp.gmail.com");  //smtp.gmail.com
//	prop.put("mail.smtp.port", "587");
//	prop.put("mail.smtp.auth","true");
//	prop.put("mail.smtp.starttls.enable", "true");
//	prop.put("mail.smtp.ssl.trust", "smtp.naver.com");
	
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");		
	
	String postmail = request.getParameter("postmail");
	String postsubject = request.getParameter("postsubmail");
	String postmsg = request.getParameter("postmsg");
		
	PrintWriter pw = response.getWriter();
	
	try {
	
		Authenticator auth = new smtp();
		
		Session sess = Session.getDefaultInstance(prop, auth);
		Message msg = new MimeMessage(sess);
		
		msg.setFrom(new InternetAddress("eejsh08@naver.com","admin","utf-8"));
		msg.addRecipient(Message.RecipientType.TO,new InternetAddress(postmail));
		msg.setSubject(postsubject);
		msg.setContent(postmsg,"text/html;charset=utf-8");
		
		Transport.send(msg);
		
		
	}catch(Exception e){
		e.getMessage();
	}
	
	pw.write(prop.toString());

	}
	
}
