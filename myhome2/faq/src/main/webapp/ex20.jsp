<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 - forward 전송</title>
</head>
<body>
<!-- jsp MVC , forward로만 제작 가능  -->


<!-- module 역활 -->
<%


%>


<!-- controll 역활 -->
<%
request.setCharacterEncoding("utf-8");

%>
<!-- param: 매개변수를 생성해서 값을 전달 할 때 사용(forward , include) -->

<p>EX20 값 전달</p>

<jsp:forward page="./ex20_1.jsp">
<jsp:param name="mid" value="hong"></jsp:param>
<jsp:param name="mname" value="홍길동"></jsp:param>
</jsp:forward>

</body>
</html>