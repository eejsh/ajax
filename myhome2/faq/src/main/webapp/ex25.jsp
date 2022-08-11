<%@page import="java.net.InetAddress"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSP 4일차 - 내장객체를 설명</title>
</head>
<body>

<!-- 내장객체 : Java 또는 import 또는 라이브러리를 사용하지 않고 사용하는 명령어-->
<!--
값 전달 시 무조건 name 또는 get으로 보낼 경우 파라미터이름으로 보내야 합니다.!!

getParameter : name값을 전달 받을 때 사용
getParameterValues : name값 전달 시 배열형태로 받을때 사용
getPanameterNames : 모든 name을 다 가져옵니다. (Enumeration : 자료형 형태로 받음..) 객체 타입형태
					String, int, double, float 사용안됨. 무조건 Enumeration으로 받음. 
getParameterMap() : Map객체 타입으로 전달받는 형태 (hashmap)
					("파라미터이름", "값");
 -->
 <!-- [!!접속자 정보를 확인 하는 경우!!] 
 
 request.getHeader("host"); : 접속자에 대한 도메인 호스트 URL 및 포트번호
 (iframe으로 접속시 도메인 다름. 그럴때 확인함.)
 
 request.getHeader("accept-language"); : 페이지 제작에 대한 언어패킷
 request.getHeader("User-Agent"); : 브라우저 접속 기기를 확인 할 때 사용
 
 request.getRemoteAddr();   : 클라이언트 IP 주소 확인
 request.getRemoteHost();   : 클라이언트 IP 주소 확인
 
 request.getRequestURI(); : 현재 있는 경로,  도메인 없이 URI 경로 및 페이지명(파일명) 출력 // 값을 보냈다가 원래 있던 곳으로 보내려면 현재 경로도 필요함! /faq/ex25.jsp
 request.getMethod(); 	: 전송 방식 !servlet:(service 에서 확인 가능, doget, dopost, get, post 확인가능!)
 
 request.getQueryString(); : parameter 문자열을 가져옵니다. 
 
 
 response.sendRedirect("www.주소.com"); : 페이지 강제 이동 (처음index에서 강제로 도메인 변경 때 많이 사용함.ex)http:///www.a.com ->http://a.com )
 -->

<%
request.setCharacterEncoding("utf-8");
String a = request.getHeader("host");  
String b = request.getHeader("accept-language");
String c = request.getHeader("User-Agent");
String d = request.getRemoteAddr();
String e = request.getRemoteHost();
String f = request.getRequestURI();
String g = request.getMethod();
String h = request.getQueryString();


//javascript location과 동일 
response.sendRedirect("http://www.naver.com");


//내장객체 아님 inetAddress : util사용. - 본 서버에서 확인 가능합니다. 
InetAddress ia = InetAddress.getLocalHost();
ia = InetAddress.getLocalHost();

//out.println(ia);
out.println(h);



%>

</body>
</html>