<%@page import="pro.ex23"%> <!-- import 해서 불러와야됨 : java -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 JAVA 파일 load</title>
</head>
<body>
<!-- 속도가 느려서 실무에서 잘 안씀..ㅠ
java 변수는 전부 static 선언해야됨 : 메모리 할당이 급격하게 커짐.

 -->
<%
//권장사항은 아님 : 기본지식만 알고있으면 됩니다. (속도가 급격하게 떨어짐, 메모리를 많이 잡아먹음..)
//ex23 ex = new ex23();
//ex.inname();

%>
<!-- jsp태그는 열면 닫아줘야됨..<></> -->
<!-- bean에 넣으면 조금 빨라짐. -->

<jsp:useBean id="abc" class="pro.ex23" scope="request">
<%-- <%abc.inname(); %> --%>
<%
request.setCharacterEncoding("utf-8");
abc.inname2("강감찬", "골드회원");

%>
</jsp:useBean>

<p>고객명 : <%=abc.names() %></p>
<p>고객 등급 : <%=abc.level() %></p>

<%-- <jsp:include page="ex23_1.jsp"> --%>
<%-- <jsp:param value="<%=abc.names() %> " name="person"></jsp:param> --%>
<%-- </jsp:include> --%>

<jsp:include page="ex23_1.jsp">
<jsp:param value="<%=abc.names() %>" name="person"></jsp:param>
</jsp:include>


</body>
</html>