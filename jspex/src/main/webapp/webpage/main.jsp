<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>웹페이지 메인</title>
<%
String m = (String)request.getAttribute("msg");
String p = (String)request.getAttribute("product");
String i = (String)request.getAttribute("imgs");

%>
<!-- ckeditor 엔진 로드 , textarea..?  -->
<script src="./ckeditor/ckeditor.js"></script>

</head>
<body>

<header style="height: 200px; background-color: yellowgreen;">
<%@ include file ="top.jsp" %>
</header>

<section style="height: 600px; background-color: orange">
<%@ include file = "view.jsp" %>
</section>

<footer style="height: 100px; background-color: gray">
<%@ include file ="footer.jsp" %>
</footer>

</body>
</html>
<script>

CKEDITOR.replace("notice_text");
//CKEDITOR 엔진에 해당 name값 가진 오브젝트를 로드 하게 됩니다.


</script>