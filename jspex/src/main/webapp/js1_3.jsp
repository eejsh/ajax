<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js1_sisson 삭제</title>
</head>
<body>
<%
//로그아웃 시 삭제, 세션만 삭제~!

//특정 session 을 삭제 할 때 사용
session.removeAttribute("mid");
session.removeAttribute("mail");
session.removeAttribute("lv");

//모든 session 삭제
session.invalidate();


%>
</body>
</html>