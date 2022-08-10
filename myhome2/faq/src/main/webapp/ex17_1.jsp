<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex17과 연계</title>
</head>
<body>

<%--
<%jsp전용
// String name="홍길동님 반갑습니다.";
// out.print(name);
%>
 --%>


<p>ex17_1페이지와 연동</p>

<% String name2 ="이순신 님 환영합니다.";
%>

<%=name2 %>
</body>
</html>