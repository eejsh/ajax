<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./config.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 파일로드 </title>
</head>
<body>
<!-- textarea로 선언하면 txt로드 시 글씨가 다 깨짐!
agree.html 파일만 작성 후 div로 로드하여 사용!  -->

<!-- JSP fileload에 대한 IO가  별도로 존재 하지 않습니다. -->

<div style="width: 1000px; height: 150px; overflow: auto; border:1px solid black; ">
<%@ include file="./agree.html" %></div>


</body>
</html>