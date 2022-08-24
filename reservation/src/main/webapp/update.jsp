<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="./dbconfig.jsp" %>
<%
request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");

String user ="강괌촨";
String pw = "kang1111";
String rno = "220824";
String person = "1";
String email = "kkc@nate.com";

String sql = "update reservation set rperson=?, remail=? where rnm =? and rpw=? and rno =? ";
PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1, person);
ps.setString(2, email);
ps.setString(3, user);
ps.setString(4, pw);
ps.setString(5, rno);

int n=0;
n = ps.executeUpdate();
if(n > 0){
	out.print("고객정보가 올바르게 수정되었습니다.");
}else{
	out.print("올바른 값이 아닙니다.");
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update</title>
</head>
<body>

</body>
</html>