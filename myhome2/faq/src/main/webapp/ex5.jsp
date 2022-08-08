<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 - 선택문</title>
</head>
<body>

<%
String level = "3";
String msg= "";

switch(level){
case "1" :
	msg ="일반회원";
	break;

case "2" :
	msg ="실버회원";
	break;
	
case "3" :
	msg ="골드회원";
	break;
	
default :
	msg ="비가입회원";
	break;
	}

%>

<input type="text" value="<%=msg%>">

<br><br>
<!-- 응용문제 반복문 + switch문 
다음과 같은 화면을 제작 하시오.-->

<% 

String pay="";
for(int f=1; f<5; f++){

	switch(f){
	case 1 :
		pay ="무통장입금";
		break;
	case 2 :
		pay ="신용카드";
		break;
	case 3 :
		pay ="도서상품권";
		break;
	case 4 :
		pay ="휴대폰 결제";
		break;
	}
%>
<input type="radio" value="<%=pay %>"> <%=pay %>
<%
}
%>


</body>
</html>