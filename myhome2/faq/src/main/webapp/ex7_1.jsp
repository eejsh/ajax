<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 값 받기(post) ex7와 연동 </title>
</head>
<body>

<%// request.setCharacterEncoding("utf-8");
// post 전송시 해당 문법을 사용해야됨 : request..

//get 한글깨짐 : encoding 선언, 단 server->server.xml->63번 line URIEncoding="UTF-8" 선언 시 별도사용안해도됨..ㅠ%>


<%= request.getParameter("mid")%> 


</body>
</html>