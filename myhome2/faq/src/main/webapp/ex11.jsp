<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isScriptingEnabled="false"%> <!-- false = 디렉티브태그 사용 불가  -->
<!-- isScriptingEnabled : 디렉티브 태그 사용 유/무 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 page 디렉티브 2</title>
</head>
<body>
<%
String name="hong";
request.setAttribute("names", name);
%>
[1]<input type="text" name="mid" value="<%=name %>" readonly="readonly">
<br>
<!-- 약어사용. setAttribute사용함  -->
[2]<input type="text" name="mid2" value="${names}" readonly="readonly">
<br>

<!-- requestScope : 디렉티브 태그를 이용하여 값을 출력합니다. -->
${requestScope.names}  <br>
<!-- 약어 -->
${names}


</body>
</html>