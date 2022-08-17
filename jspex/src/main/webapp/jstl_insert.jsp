<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sql:setDataSource  
var="dbs" 
url=""
driver ="" 
user="
password="></sql:setDataSource>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 - SQL 데이터 입력</title>
</head>
<body>
<!-- update : insert , update , delete 3가지만 사용합니다. -->

<sql:query var = "sresult" dataSource="${dbs}">
select count(*) from poll where id ='lee';
</sql:query>

<!-- 해당 값에 대한 SQL 저장 여부를 확인하는 작업 -->
<%-- <aa:out value="${sresult.rowCount}"></aa:out> <br>  <!-- 1 row in set 에서 1값! --> --%>
<%-- <aa:out value="${sresult.rowsByIndex[0][0]}"></aa:out> <!-- count 갯수 출력 --> --%>

<aa:if test ="${sresult.rowsByindex[0][0]==0}">

<sql:update var="result" dataSource="${dbs}">
insert into poll values ('0','이순신','lee3','01012345678','3','2022-08-17 13:14:00','0001-00-00 01:00:00');
</sql:update>
<aa:if test="${result==0}">입력 오류</aa:if>
<aa:if test="${result==1}">입력 성공</aa:if>

</aa:if>

</body>
</html>
