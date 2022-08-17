<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource  
var="dbs" 
url="jdbc:mysql://umj7-009.cafe24.com/eejsh08"
driver ="com.mysql.jdbc.Driver" 
user="eejsh08" 
password="hoho12!@"></sql:setDataSource>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 - SQL 데이터 수정</title>
</head>
<body>
<sql:update dataSource="${dbs }" var ="result">
update poll set tel=? where idx=? 
<sql:param value="01000010001"></sql:param>
<sql:param  value="21"></sql:param>
</sql:update>
<aa:if test="${result==1}">수정완료</aa:if>
<aa:if test="${result==0}">수정안됨</aa:if>
</body>
</html>