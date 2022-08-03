<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- MVC : view 파트 , 출력만 함 -->
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-compatible" content="ie=edge, chrome=1">
<title>로그인 완료</title>
<script>

function logout(){
	
	if(confirm("로그아웃 하시겠습니까?")){
		location.href='./logout.jsp';
		
	}
}

</script>
</head>
<body>
<% 
//jsp는 별도의 import 사항이 없는 상황 입니다.

// 로그인없이 강제로 들어올 경우 처리하는 파트
 if(session.getAttribute("pmn")==null){
	PrintWriter pr = response.getWriter();
	pr.print("<script>alert('접근이 잘못 되었습니다.'); history.go(-1); </script>");
 }
%>

<%= session.getAttribute("pmn") %> 님 환영합니다.
[아이디] <%= session.getAttribute("pid") %>
<br>
<input type="button" value="로그아웃" onclick="logout();">


</body>
</html>