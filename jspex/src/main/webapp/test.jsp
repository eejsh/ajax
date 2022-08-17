<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
<%@ include file = "./js2.jsp" %>

<!-- http://localhost:8080/jspex/test.jsp?sign=js2 로 접속 할 시 ..  -->

<%
String uri = (String)request.getParameter("sign").intern();
out.print(uri);

if(uri=="js2"){
	

%>

<span>
<jsp:include page="./js2.jsp"></jsp:include>
</span>
<%}
else{
	
%>
<span style="margin-top: 300px">
<jsp:include page="./js1.jsp"></jsp:include>
</span>

<%
}
%>
</body>
</html>