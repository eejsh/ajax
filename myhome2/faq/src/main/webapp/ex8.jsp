<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - SPA 만들기</title>
</head>
<body>
<!--
form 전송 MPA+SPA
AJAX 전송 SPA + JS or JQ or ECMA 

MPA : multi page application  단점: back이 front 역활까지 해야됨..ㅠ

SPA : single page application 싱글페이지 ,모바일에서 많이 사용됨. 자기페이지에서 값을 넘겨 처리함. back, front 가 명확하게 코드가 나누어짐.
spa가 안되는 경우 : servlet 안됨, 일반적으로 jsp 단독으로 실행될때만 사용가능.

-->

<!-- spa ex -->
<% 
request.setCharacterEncoding("UTF-8");
String mid = request.getParameter("userid");

out.print(mid);  //처음 값없을시 null, submit으로 값 전송시 값 출력됨.


if(mid != null){
	out.print(mid);
}
else{
%>
<form name="frm" id="frm" method="post" action="./ex8.jsp">
<input type="text" name="userid">
<input type="submit" value="전송">
</form>
<%}%>


</body>
</html>