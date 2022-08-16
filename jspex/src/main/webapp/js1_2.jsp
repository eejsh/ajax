<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js1_session 확인</title>
</head>
<body>

<% 

//attribute -> object로 받음, string으로 변환.

session.setMaxInactiveInterval(60*60);  //페이지 이동시 초기화

Object id = session.getAttribute("mid");
Object lv = session.getAttribute("lv");
String mail = (String)session.getAttribute("mail");

out.print(id+"<br>");
out.print(lv+"<br>");
out.print(mail);

%>

</body>
</html>