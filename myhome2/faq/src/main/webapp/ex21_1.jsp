<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 실제 작동되는 곳은 ex21.jsp -->
<title>JSP 3일차 include 전달받음 </title>
</head>
<body>

	<p>값 전달받음</p>

<%
String mid = request.getParameter("mid");
String mname= request.getParameter("mname");
String c = request.getParameter("c");



%>
아이디 : <%=mid %>
고객명 : <%=mname %>
데이터 추가 : <%=c %>

<jsp:include page="./ex21_2.jsp">

<jsp:param value="연습입니다." name="c"/>

</jsp:include>



</body>
</html>