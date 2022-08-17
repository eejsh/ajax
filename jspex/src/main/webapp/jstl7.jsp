<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 - JSTL 문자열</title>
<!-- JSTL에는 Math 없음 (cell, round, floor 기능 없음. jsp에서 사용해야됨(올림.내림.반올림..) -->

</head>
<body>

<% String msg = "테스트 입니다."; %>
<aa:set var ="msg" value=" 홍길동님 반갑습니다."></aa:set>
${fn:length(msg)}<br> <!-- 문자열갯수 -->
${fn:substring(msg,0,4)}<br> <!-- 문자열 자를 경우 -->
${fn:replace(msg, "홍길동", "이순신")}<br> <!--문자열 단어 변경 -->
${fn:indexOf(msg,"길동")} <br><!-- 문자열 단어 검색 (-1이면 단어없음)ㄴ -->
${fn:trim(msg)}<br> <!--문자열  맨앞, 멘뒤 공백이 없어짐. -->

<aa:out value="msg"></aa:out> <br>  <!-- 출력 : msg -->
<aa:out value="${msg}"></aa:out> <br><!-- 출력 :홍길동님 반갑습니다. -->
<aa:out value="<%=msg %>"></aa:out> <br><!-- 출력 : 테스트 입니다. -->
</body>
</html>