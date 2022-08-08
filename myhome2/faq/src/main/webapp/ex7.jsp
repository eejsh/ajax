<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 값 전달하기(Form) post</title>
<script>

function abc(){
	frm.submit();
	
}


</script>
</head>
<body>

<form name="frm" id="frm" method="post" action="./ex7_1.jsp" >
<input type="text" name="mid">
<input type="button" value="전송" onclick="abc();">


</form>



</body>
</html>