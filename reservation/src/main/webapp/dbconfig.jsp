<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con = null;

try{
	String db = "";
	String url = "j";
	String user = "j";
	String pw = "jav";
	
	Class.forName(db);
	con=DriverManager.getConnection(url,user,pw);
	
//	out.print("db접속성공"); insert.jsp 접속확인함
	
	
}catch(Exception e){
String error = e.getMessage();

}



%>
