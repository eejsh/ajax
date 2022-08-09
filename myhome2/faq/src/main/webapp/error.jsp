<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<!-- isErrorPage : false(기본) : 일반페이지
isErrorPage : true  => 자신의 페이지는 error 발생 시 사용되는 페이지로 인식하게 됨. 
 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ERROR 페이지 </title>
</head>
<body>
<% out.print("code error"); %>


</body>
</html>