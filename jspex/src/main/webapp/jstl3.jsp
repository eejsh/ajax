<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 
core : jstl 의 기본 엔진 (set등)
functions : 문자열 함수
sql : DB 연결
fmt(formattiong) : 시간, 날짜, 다국어

java, jsp 문법 사용X
단, 프레임워크로 돌아감
 -->


<!-- import 안씀! 태그에 있는 엔진 바로 적용중.. -->
<%
//응용문제
request.setCharacterEncoding("utf-8");
String data[] = {"홍길동", "이순신", "강감찬", "유관순"};

%>
<aa:set var ="user" value="<%=data %>"></aa:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 jstl 반복문</title>
</head>

<!-- forEach 출력부분 -->
<body>

<table>
<tr>
<aa:forEach var="a" begin="1" end="5">
<td><aa:out value="${a}"></aa:out></td>
</aa:forEach>
</tr>
</table>
<br>

<aa:forEach var ="b" begin="2" end="4" >
	<aa:forEach var = "c" begin="1" end="5">
	<span>${b} * ${c} =${b*c}</span> 	
	</aa:forEach>
</aa:forEach>
<br><br><br>

<!-- <aa:forEach var="nm" items="${user}"> -->
<!-- 고객명 : &{nm}  </aa:forEach> -->

<aa:forEach var="nm" begin ="0" end="${ fn:length(user)-1 }">
고객명 : ${user[nm]} <br>
</aa:forEach>



</body>
</html>