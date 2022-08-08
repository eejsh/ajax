<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 - 기초문법</title>
</head>
<body>
<%-- <% script language%> --%>
<%-- <% (JSP 시작) / (JSP 종료) %> --%>
<%-- <%!..... %> : !자바 변수나 메소드를 정의할 때 사용 --%>
<%-- <%=...  %> : 해당 값을 출력하는 문자열, 숫자열 등 사용합니다. --%>
<%-- <%@ %> : 페이지 속성 지정 & 외부 페이지 로드 할 수 있음..--%>

<%@ include file ="ex2.jsp" %>

<!-- java 문법 -->
<%!

int a;
int b;
public int sum(int aa, int bb){ //-->java문법..
	return aa+bb;
}
//문법을 나눠서 사용해야 error가 안남..
%>  
<!-- JSP 문법 -->
<%
	a=10;
	b=20;
	out.print(sum(a,b)); //jsp 출력 : out.print

%>
<!--JSP 문법만 사용 -->

<ul>
<li></li>
<% for(int i=0; i<9; i++){ %>
<li><%=i %></li>
<%} %>

</ul>







</body>
</html>