package test;
//해당되는 서버

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
import javax.xml.ws.soap.AddressingFeature.Responses;
public class mailto extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public mailto() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");		
	PrintWriter pwrite = response.getWriter();
	
	
	String postmail = request.getParameter("postmail");  //회원가입시 회원 메일 (받는 이)
	String postsubject = request.getParameter("postsubmail"); //제목
	String postmsg = request.getParameter("postmsg"); //내용
	String admin = request.getParameter("admin"); 
	
	String host = "smtp.naver.com";  //네이버 서버명
	String user  = admin;  //관리자 ( 보내는 이 )
	String pw = "VWMT24XBHPSM"; //네이버 로그인 pw
	
	//properties, map : 같은 속성임  (열거형: 키값이 잇는 배열)
	
	Properties pr = new Properties();
	pr.put("mail.smtp.host", host);                   //smtp
	pr.put("mail.smtp.port", 587);
	pr.put("mail.smtp.auth", true);  //auth :메일 전송에 따른 연결인증 절차를 말합니다.  
						   //false : id,pw 없이 연결 할 경우..인증메일, 쿠폰 보내는 메일 같은 경우 false 사용..
	pr.put("mail.smtp.debug", true); //메일 회신 정보 결과 체크 (안써도됨)
	pr.put("mail.smtp.socketFactory.port", 587); // 자신의 pc 포트를 오픈함
	pr.put("mail.smtp.ssl.protocols", "TLSv1.2"); //TLS 규격 버전
	// SSLv2, SSLv3, TLSv1, TLSv1.2, TLSv1.4, TLSv1.6 , 높은버전 안됨 낮은버전으로..
	
	//authenticator : 암호화 , otp 비밀번호를 사용,, 비밀번호 생성. ex: 로그인 회원가입(비밀번호)
	Session se = Session.getDefaultInstance(pr, new javax.mail.Authenticator() {
		@Override
		protected PasswordAuthentication getPasswordAuthentication() {
			return new PasswordAuthentication(user, pw);   
			
		}
	});	
	
	try {
		MimeMessage msg = new MimeMessage(se);  //session 적용..
		msg.setFrom(new InternetAddress(admin,"관리자"));    // 송신자 정보
		msg.addRecipient(Message.RecipientType.TO, new InternetAddress(postmail));  //수신자
		msg.setSubject(postsubject);  //메일(수신)제목
		String img="<span style='display:block; border:1px solid #ccc, width:300px; height:30px text-ailgn:center;"
				+ "line-hight:30px'>"
				+ "<a href='http://eejsh08.cafe24.com/index.jsp?mail="+postmail+"'>"  // jsp?mail=수신자메일.. parameter로 받아서 확인! 
				+ "[인증번호 : 12345678]"
				+ "</a>"
				+ "</span>";
	//	String img = "<img src=http://t1.daumcdn.net/friends/prod/editor/dc8b3d02-a15a-4afa-a88b-989cf2a50476.jpg>";
		msg.setContent(img, "text/html; charset=utf-8");
	//	msg.setText(img);  // 메일(수신)내용 
		
	//  msgContent : text/html 을 이용하여 태그를 적용하여 메일 발송 하게 됩니다.
		Transport.send(msg);   // 메일 발송
		System.out.println("전송완료");
		
//		pwrite.write(msg.toString());
		
	}catch (Exception e) {	
			e.printStackTrace();
	}
	
	
		}
	
}


/*
 * javax.mail   - ① 라이브러리 추가

	-mail-1.4.7jar   :  메일 클라이언트 (outlook 동일)
	-mailapi.jar     :  메일서버 (송.수신) 
	-dsn.jar	     :  메일 송.수신된 내용을 데이터 소스로 변환하여 저장 시킬수 있도록 함
	-gimap.jar       :  이미지 첨부 파일에 대한 파일저장 및 출력
	-imap.jar        :  첨부파일 및 메일내용 출력  (서버와 동기)
	-pop3.jar        :  첨부파일 및 내용   (서버와 비동기) , 메일삭제 시 복구안됨
	-smtp.jar        :  메일 발송 담당
pop3 port 사용 시 pop3.jar 작동됨

② 각 송 수신에 대한 서버 메일을 셋팅 (각 회사마다 세팅 틀림, 환경설정->IMAP, pop3 설정)
    - IMAP/SMTP 수신을 체크 해야 합니다.
    - SSL 기능 : https 시 사용  ,  통신관련 보안 정책
    - TLS 기능 : SSL 이 없을 경우 사용 , 통신관련 보안 정책  
    - SMTP 서버주소, SMTP 포트번호

③ 코드 작성 시 필요사항
   - 송신메일 주소
   - 수신메일 주소
   - 수신제목
   - 수신내용
※ SMTP 접속 아이디 및 패스워드가 필요함 (단, 자체서버일 경우 사용안함)
 * 
 * */

