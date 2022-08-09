<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 데이터전송</title>
</head>
<body>


<form name="frm" id="frm" method="post"  action="ex14.jsp"> 
<input type="hidden" name="security" value="loginok">
<input type="text" name="usernm"><br>
<input type="text" name="userid"><br>

<input type="radio" name="agree" value="Y">동의함<br>
<input type="radio" name="agree" value="N" checked>동의안함<br>

<input type="password" name="userpw"><br>
<input type="password" name="userpw2"><br>

<input type="submit" value="전송"><br>

<!-- database에 한번에 보낼땐 편함. 단, 불필요한 name값 까지 전송될 수 있음. 
ex) userpw2:확인 패스워드 는 필요없음..
name userpw2까지 전송할 경우 if문으로 걸러줘야됨 ㅠ

 -->
</form>



</body>
</html>