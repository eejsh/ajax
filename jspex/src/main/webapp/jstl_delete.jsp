<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource  
var="dbs" 
url="
driver =
user=
password=""></sql:setDataSource>
<!-- jstl db는 알아서 종료. dbs.close(); 필요없음 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 데이터 삭제</title>
</head>
<body>

<sql:update dataSource="${dbs }" var ="result">
delete from poll where id=?
<sql:param value="lee"></sql:param> <!-- param: ? 사용가능! -->
</sql:update>
<aa:if test="${result==1}" >삭제완료</aa:if>
<aa:if test="${result==0}" >삭제오류</aa:if>



</body>
</html>
