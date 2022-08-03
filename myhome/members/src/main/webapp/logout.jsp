<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatible" content="ie=edge, chrome=1">
<title>로그아웃</title>
</head>
<body>
<%= session.getAttribute("pnm")%>
<%= session.getAttribute("pid")%>
<% session.invalidate(); %> <!-- session.invalidate(); 세션 값을 없앰 -->


</body>
<script>
//session.invalidate(); 후 바로 작동되야되므로 아래에 위치
//alert("정상적으로 로그아웃 되셨습니다~");
alert("정상적으로 로그아웃됨 메롱");
location.href='./index.html';


</script>
</html>