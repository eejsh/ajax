<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
    <% 
    request.setCharacterEncoding("utf-8");
    String mb = request.getParameter("number");
    %>
    <aa:set var="n" value="<%=mb %>"></aa:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jstl2.html 연동</title>
</head>
<body>
<!-- 
choose : 다중 처리 조건문을 사용함 
if : 조건문을 처리함. 
 -->

<%-- <aa:choose> --%>
<!-- choose (when, otherwise)태그와 함께 사용하는 태그명  
 	when : 참일 경우
	otherwise : 거짓 일 경우
-->
<%-- <aa:when test="${n%2==0}"> --%>
<%--  <aa:out value="${n}"></aa:out>은 짝수 입니다. --%>
<%-- </aa:when> --%>

<%-- <aa:when test="${n%2!=0}"> --%>
<%--  <aa:out value="${n}"></aa:out>은 홀수 입니다. --%>
<%-- </aa:when> --%>
<%-- </aa:choose> --%>

<!-- intern 필요없음... == .... eq로 사용됨. -->

<aa:if test="${n eq '홍길동'}">
<span>가입 고객 입니다.</span>
</aa:if>

<aa:if test="${n == '이순신'}">
<span>가입 고객 입니다.</span>
</aa:if>


</body>
</html>