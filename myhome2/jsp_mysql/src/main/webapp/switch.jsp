<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//select2.jsp 에서 받은 cate 부분을 switch 문으로 확인.

String cate = request.getParameter("cate").intern();
String msg = "";  //해당 코드번호를 한글 또는 영문화로 변경!(ex itext=1, 스위치 1:java:servlet으로 변경)
switch(cate){

case "0" :
	msg = "JAVA";
	break;
case "1" :
	msg ="JAVA Servlet";
	break;
case "2":
	msg="Javascript";
	break;
case "3" :
	msg ="AJAX";
	break;
case "4":
	msg ="JSP";
	break;	
	
}
request.setAttribute("msg", msg);

//select2.jsp 로 리턴

//setAttribute msg로 select2로 보냄!



%>
