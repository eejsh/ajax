<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 - 전체 리스트 및 pageing 사용법</title>
</head>
<body>

<sql:setDataSource  
var="dbs" 
url="jdbc:mysql://umj7-009.cafe24.com/eejsh08"
driver ="com.mysql.jdbc.Driver" 
user="eejsh08" 
password="hoho12!@"></sql:setDataSource>
<%
String startpage ="0";
String pageno ="3"; //1페이지 당 2개 
String getpage = (String)request.getParameter("p");


if(getpage==null || getpage.equals("")|| getpage.equals("1")){
startpage = "0";  //첨에 접속 시 0부터 시작..
}else{
	int s = Integer.parseInt(pageno);  //한 페이지에 보여줄 데이터 갯수
	int g = Integer.parseInt(getpage); //페이징 번호값
	int t = (g-1)* s;    // (페이지 번호 -1 )* 한 페이지 당 보여줄 갯수  
	startpage = String.valueOf(t);
	
	
}
%>

<!--  전체 갯수 -->

<sql:query var="num" dataSource="${dbs}">
select * from poll order by idx desc ;
</sql:query>

<%-- <aa:out value="${num.rowCount }"></aa:out> <!-- 전체갯수파악 --> --%>

<!-- 1페이지 당 출력  -->
<sql:query var="datas" dataSource="${dbs}">
select * from poll order by idx desc limit <%=startpage %>,<%=pageno %> ;
</sql:query>



<aa:out value="${datas.rowCount}"></aa:out>


<!-- select * from poll order by idx desc; -->
<%-- <!-- select * from poll order by idx desc limit 0,<%=pageno %> --> --%>



<table border="1" >
<tr>
<td>no</td>
<td>아이디</td>
<td>고객명</td>
<td>전화번호</td>
<td>입력일자</td>
</tr>

<aa:set var="spage" value="<%=startpage %>"></aa:set>

<aa:forEach var= "data" items="${datas.rows}" varStatus="ct">
<!-- varStatus : 순번을 체크함 (count(1~ 1부터~), index(0~ 0부터) -->

<tr>
<%-- <td>${num.rowCount-ct.index}</td> --%>

<td><aa:out value="${(num.rowCount-spage)-ct.index}"></aa:out></td>
<td><aa:out value="${data['id']}"></aa:out></td>
<td><aa:out value="${data['name']}"></aa:out></td>
<td><aa:out value="${data['tel']}"></aa:out></td>
<%-- <aa:set var = "indate" value="${data['indate']}"></aa:set> --%>
<td><aa:out value="${fn:substring(data['indate'],0,10)}"></aa:out></td>
</tr>

</aa:forEach>
</table>


<table border="1">

<tr>
<aa:set var="pageno" value="<%=pageno %>"></aa:set>
<aa:set var="pagenum" value="${num.rowCount/pageno+((1-num.rowCount/pageno%1))%1}"></aa:set>

<aa:forEach var="ns" begin="1" end="${pagenum }">
<td onclick="pagego(${ns})" >${ns}</td>
</aa:forEach>
</tr>

</table>

</body>
<script>
function pagego(p) {
//	console.log(p);
	location.href ='./pageing.jsp?p='+p;
	
}

</script>


</html>