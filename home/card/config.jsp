<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con = null;

try{
	String db = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql:";
	String user = "";
	String pw = "";
	
	Class.forName(db);
	con=DriverManager.getConnection(url,user,pw);
   // out.print("db접속성공"); //insert.jsp 접속확인함
	
	
}catch(Exception e){
String error = e.getMessage();

}



%>
