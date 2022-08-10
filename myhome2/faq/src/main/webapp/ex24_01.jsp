<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 - 상품검색 응용파트</title>
<script>

function abc() {
	if(f.search.value==""){
		alert("검색할 상품명을 입력하세요");
		return false;
		
	}else{
		return;
	}
	
}

<%
request.setCharacterEncoding("utf-8");
String ss = request.getParameter("search"); //ex24_01.jsp include -> param으로 값 리턴시 적용.

//!ss.equals(null) : null이아닐때,, 
if(ss==null || "null".equals(ss)){   //최초 실행 시 값이 없을 경우 처리.
	
	ss="";
	
}

%>

</script>


</head>
<body>
	<form name="f" id="f" method="post" action="./ex24_02.jsp"; onsubmit="retrun abc();">
		<p>사용자 입력 페이지</p>
		<input type="text" name="search" value="<%=ss %>" >
		<input type="submit" value="검색">
	</form>
<jsp include></jsp>

</body>
</html>