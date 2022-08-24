package test;

import java.io.IOException;
import java.util.Properties;

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

public class reserindex extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public reserindex() {
    }

    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}


	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		String name = request.getParameter("name");  //회원 메일
		String tel = request.getParameter("tel");   //회원 전화번호
		String mail = request.getParameter("email");  //회원메일
		String num = "12345-678912";
		
		String host = "smtp.naver.com";
		String user = "@naver.com";
		String pw = "";
		
		System.out.println(name + tel + mail);
		
		Properties pr = new Properties();
		pr.put("mail.smtp.host", host);                 
		pr.put("mail.smtp.port", 587);
		pr.put("mail.smtp.auth", true);    
							
		pr.put("mail.smtp.debug", true); 
		pr.put("mail.smtp.socketFactory.port", 587); 
		pr.put("mail.smtp.ssl.protocols", "TLSv1.2"); 
		
			Session se = Session.getDefaultInstance(pr, new javax.mail.Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(user, pw);   
				
			}
		});	
		
		try {
			MimeMessage msg = new MimeMessage(se);  //session 적용..
			msg.setFrom(new InternetAddress(user,"관리자"));    // 송신자 정보
			msg.addRecipient(Message.RecipientType.TO, new InternetAddress(mail));  //수신자
			msg.setSubject("펜션예약정보");  //메일(수신)제목
			String img="펜션예약정보입니다."
				+"<li>고객명 "+name+"</li>"
				+"<li>연락처 "+tel+"</li>"
				+"<li>이메일 "+mail+"</li>"
				+"<li>예약번호"+num+" </li>"
				+"<li>"
				+ "<a href='http://aa.cafe24.com/index.jsp?mail="+mail+"'>"
				+ "<input type='button'value='입금하기'></a>"
				+ "</li>"
				+"</ol>";
			msg.setContent(img, "text/html; charset=utf-8");
			
			Transport.send(msg);   // 메일 발송
			System.out.println("전송완료");
			
		}catch (Exception e) {	
				e.printStackTrace();
		}
	
	}

}
