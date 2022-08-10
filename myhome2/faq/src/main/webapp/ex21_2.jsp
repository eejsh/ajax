<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 include 리턴 콜</title>
</head>
<body>


 	<p>EX21.JSP 리턴콜</p>
<%
String mid2 = request.getParameter("mid");
String mname2= request.getParameter("mname");
String c = request.getParameter("c");
String d = "ex21_2에 대한 값";  //
%>
<%=mid2 %>
<%=mname2 %>
<%=c %>


</body>
</html>