<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- jsp를 추가하여 if, for 기타등등 쉽게 적용할 수 있도록 사용하는 방식입니다. 프레임워크..
prefix : 생성 태그 명 (jsp를 전체 컨트롤 함.)
uri : 외부 jstl 코어를 가져올 때 사용
tagdir : 자신의 서버에 있는 코어를 사용할 때 사용

 -->
 
 <!-- JSP(if, for, while, 데이터베이스) : JSTL 쉽게 내장객체로 접근 하도록 하는 라이브러리 
JSTL (jsp보다 조금빠름) → jstl.jar 라이브러리 필요함.

out.print 필요 없이 원하는곳에 사용 가능 <% %> 필요없음
<$@taglib%> :  JSTL 선언!
-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 - JSPL1 문법</title>
<%
request.setCharacterEncoding("utf-8");

String user = request.getParameter("user");
response.setContentType("text/html; charset=utf-8");
//out.print(user);
%>

<!-- JSTL 태그로 출력 파트
out : 출력파트
set : 변수를 선언할 때 사용
remove : 변수를 제어할 때 사용
catch : 예외처리
 -->
<%-- <aa:set var="user" value="${user}"></aa:set> --%>

<aa:set var="user2" value="<%=user %>"></aa:set>
<!--  var : 변수명을 생성 
      value : 값을 입력 받음-->
     
<aa:out value="${user2}"></aa:out>

</head>
<body>

<form name="f" id="f" method="post" action="./jstl1.jsp">
<input type="text" name="user">
<input type="submit" value="전송">
</form>
<span> 고객명 :  <aa:out value="${user2}"></aa:out> </span>
<!--   out : 출력 , value만 존재함! -->

</body>
</html>