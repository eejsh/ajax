<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 제작자 마음대로 이름 바꿀수 있음 frefix="아무개이름" -->
<!-- sql:setDataSource : DB연결 태그  
dbs라는 변수에 url, driver, user, password 넣어서 연결-->
<sql:setDataSource  
var="" 
url="
driver ="r" 
user="" 
password="></sql:setDataSource>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 SQL 연결</title>
</head>
<body>
<!-- dataSource : connect
query : db쿼리문 (select)
udate : db쿼리문 (insert, update, delete)
var로 query문으르 실행하게 됨. 
 
 -->

<sql:query var="select" dataSource="${dbs}">
select * from poll order by idx desc;
</sql:query>

<!--columnNames : sql의 필드명을 가져올 때 사용 -->
<aa:forEach var= "poll" items="${select.columnNames}">
<span><aa:out value="${poll }"></aa:out></span> <!-- 컬럼명 -->
</aa:forEach>

<br><br>
<!-- rows : 필드에 있는 값 -->
<aa:forEach var="data" items="${select.rows }">

<span> <!-- ${data['필드명']} -->
<aa:out value="${data['name']} "></aa:out>
</span> 

<span>
<aa:out value="${data['id']} "></aa:out>
</span> 


<span>
<input type="button" value="삭제" onclick="abc(${data[idx]})"><br>
</span>

</aa:forEach>

</body>
<script>

function abc(z) {
	alert(z);
	
}

</script>

</html>
