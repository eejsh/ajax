<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js2.jsp - cookie 생성</title>
</head>
<body>

<%
String user ="홍길동";
String email = "hong@nate.com";

Cookie ck = new Cookie("parson", user);  //쿠키값 생성
Cookie ck2 = new Cookie("email", email);

//pc에 저장 → 서버로 보내야됨.

response.addCookie(ck);  // 생성한 쿠키 값을 서버에 전송
response.addCookie(ck2);




%>

</body>
</html>