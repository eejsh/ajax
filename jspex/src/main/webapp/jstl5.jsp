<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="userinfo" tagdir="/WEB-INF/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 tagdir 사용법</title>
</head>
<body>
<aa:set var="username" value="홍길동"></aa:set>
<!-- 태그 파일을 로드 할 때 사용방식 : prifix="이름" tagdir ="경로/파일명"> 
단, 태그파일 안에 내용 추가 시 tagdir 파일을 수정해야됨. -->
<userinfo:test></userinfo:test>
<br>
<userinfo:test2>${username}님 ㅎ2</userinfo:test2>
<br>
<userinfo:test3>${username}</userinfo:test3>
<br>
<userinfo:test3><%out.print("test"); %></userinfo:test3>

</body>
</html>