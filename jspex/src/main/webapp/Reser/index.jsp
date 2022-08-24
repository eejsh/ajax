<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
.scss {
	display: block;
	border-style: solid;
	border-width: 1px;
	border-color: black;
	width: 200px;
	height: 25px"
}
.olcss {
	list-style: none;
	margin: 0;
	padding: 0;
	width: 300px;
	height: 150px;
}

.olcss>li {
 	width: inherit;
 	height: 50px;
}

</style>

<meta charset="UTF-8">
<title>펜션예약등록시스템</title>
</head>
<body>
<span>펜션 예약등록 시스템</span>

<form id="f" name="f" method="post" action="./reser.jsp" enctype="application/x-www-form-urlencoded">

<ol class="olcss"><br>
<li class="licss">고객명 <input type="text" name="name"></li>
<li>연락처 <input type="text" name="tel"></li>
<li>이메일 <input type="text" name="email"></li>
</ol>
<br>
<input type="button" value="예약등록" onclick="ok()">
</form>



</body>
</html>
<script>

function ok() {

	if(f.name.value=="" && f.tel.value=="" && f.email.value==""){
		alert("빈칸을 모두 채워주세요.");
		
	}else{
		f.submit();
		
	}
	
}

</script>