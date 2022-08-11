<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.Timer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>설문조사 참여자 저장파일 [insert]</title>
</head>
<body>

<%@ include file="./dbconnect.jsp"%>
<%

request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");


String name = request.getParameter("name");
String id = request.getParameter("id");
String tel = request.getParameter("tel");
String itext = request.getParameter("itext");

if(tel.length()< 10){
	out.print("<sciprt>alert('올바른 값이 아닙니다.'); history.go(-1)</script>");
}


LocalDateTime now = LocalDateTime.now();
DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
String timer = now.format(fm);

//out.print(name+id+tel+itext+timer); 값확인..ㅠ
try{
	
String sql = " insert into poll values ('0',?,?,?,?,?,'0001-01-01 01:00:00'); " ;
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,name);
ps.setString(2,id);
ps.setString(3,tel);
ps.setString(4,itext);
ps.setString(5,timer);

int n = 0;
n=ps.executeUpdate();
	
	String msg = null;
	
	if(n>0){
		
		%>
<jsp:include page="select2.jsp"></jsp:include>

		<%
		
	}else{
		throw new Exception("error");
	}
	
}catch(Exception e){
	out.print("DB연결 실패ㅠ");
}

%>

</body>
</html>