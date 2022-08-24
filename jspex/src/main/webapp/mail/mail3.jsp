<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="test.se"%>
<%@page import="javax.mail.Session"%>
<%@page import="javax.mail.Authenticator"%>
<%@page import="java.util.Properties"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String postmail = request.getParameter("postmail");
String postsubject = request.getParameter("postsubject");
// String postmsg = request.getParameter("postmsg");

String ckeditt = request.getParameter("ckeditt");
%>    

<% 
Properties pro = new Properties();
pro.put("mail.smtp.host", "smtp.naver.com");
pro.put("mail.smtp.port", 587);
pro.put("mail.smtp.auth", true);

pro.put("mail.smtp.debug", true);
pro.put("mail.smtp.socketFactory.port", 587);
pro.put("mail.smtp.ssl.protocols", "TLSv1.2");

try {   
	//se.java와 연계하여 Session 을 로드하게 됨.
	Authenticator at = new se();
	Session se = Session.getInstance(pro, at);
	
	//본 코드 = servlet 와 동일 
	MimeMessage msg = new MimeMessage(se);
	msg.setFrom(new InternetAddress("관리자"));
	msg.addRecipient(Message.RecipientType.TO, new InternetAddress(postmail));
	msg.setSubject(postsubject);
	String aa = ckeditt;
	
	msg.setContent(aa, "text/html; charset=utf-8");
	Transport.send(msg);
	out.print("<script>alert('발송.. '); </script>");

} catch (Exception e) {
	e.getStackTrace();
}



%>

    
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일발송(CKeditor)</title>
<script src="./ckeditor/ckeditor.js"></script>

</head>
<body>


<form name="f" id="f" method="post" enctype="application/x-www-form-urlencoded" action="./mail3.jsp">
<div>
<ul>
<li>
<input type="hidden" name="admin" value="eejsh08@naver.com"><br>
메일주소(받는분) : <input type="text" name="postmail"><br>
제목 : <input type="text" name="postsubmail"><br>
메일내용 : <textarea name="ckeditt" id="ckeditt"></textarea><br>
<input type="button" value="메일전송" onclick="ok()">
</li>
</ul>
</div>
</form>



</body>
</html>


<script>

CKEDITOR.replace("ckeditt");

function ok() {
	f.submit();
	
}
</script>