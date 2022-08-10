<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP3일차 - ex20.jsp 의 값을 전달받음.</title>
</head>
<body>

<!-- View 역활 -->
<%
request.setCharacterEncoding("utf-8");
String mid = request.getParameter("mid");
String mname= request.getParameter("mname");

%>
<br>
아이디 : <%=mid %><br>
고객명 : <%=mname %>
</body>
</html>