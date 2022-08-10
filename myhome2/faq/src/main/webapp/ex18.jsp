<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP forward 형태 , ex17_1.jsp 연계 //ex18</title>
</head>
<body>
<p>해당 페이지는 ex18.jsp 페이지입니다. </p>
<jsp:forward page="./ex17_1.jsp"></jsp:forward>

<!-- 자신의 결과값 또는 HTML 코드 등 출력안함. -->
<p>응답확인</p>



</body>
</html>