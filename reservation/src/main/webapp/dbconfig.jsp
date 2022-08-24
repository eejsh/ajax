<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con = null;

try{
	String db = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://kbsn.or.kr:3306/cclass";
	String user = "java_c";
	String pw = "java_cclass";
	
	Class.forName(db);
	con=DriverManager.getConnection(url,user,pw);
	
//	out.print("db접속성공"); insert.jsp 접속확인함
	
	
}catch(Exception e){
String error = e.getMessage();

}



%>