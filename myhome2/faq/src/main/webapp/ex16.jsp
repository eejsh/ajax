<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./config.jsp" %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - 기본문법 형태(날짜출력)</title>
</head>
<body>


<%

Date day = new Date();  //현재날짜 KST : 한국시간, UST :미국시간.
out.print(day);

int h = day.getHours();
int m = day.getMinutes();
int s = day.getSeconds();

out.print("<br>"+h+"시"+m+"분"+s+"초"+"<br>");


int y = day.getYear()+1900; //day.getYear() 버그.. 사용안함. 2000년도 넘어가면서 버그남. 1900+ 해주면 정상년도 표시됨..
int mm = day.getMonth()+1; //월
int d = day.getDate(); //일 
int w = day.getDay(); //요일

out.print("<br>"+y+"년"+mm+"월"+d+"일"+"<br>");


out.print(y+"<br>");
out.print(mm+"<br>");
out.print(d+"<br>");
out.print(w+"<br>");



%>

</body>
</html>