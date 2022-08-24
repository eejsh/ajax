<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// ArrayList<String> data = new ArrayList(Arrays.asList(request.getAttribute("al")));
//[[aa,aa,aa]] 배열이 이상해짐..ㅠ  setattribute에서 개별로 보내야됨.. select2.java


String rname = (String)request.getAttribute("rnm");
//object 성격이므로 (String)으로 변환시켜주면 js에서도 사용할 수 있음.



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>select2-servlet과 연계</title>
</head>
<body>

<%-- <%=request.getAttribute("al") %> --%>

<%-- <%=data%> --%>


<%=request.getAttribute("rnm") %> <br>
<%=request.getAttribute("remail") %> <br>
<%=request.getAttribute("rtel") %> <br>

</body>
</html>