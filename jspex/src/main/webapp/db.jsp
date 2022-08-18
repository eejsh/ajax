<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
   response.setContentType("text/html; charset=utf-8");
   Connection con = null;
   try{
      String d = "com.mysql.jdbc.Driver";
      String u = "jdbc:mysql://umj7-009.cafe24.com/eejsh08";
      String user = "eejsh08";
      String pw = "hoho12!@";
      Class.forName(d);
      con = DriverManager.getConnection(u, user, pw);
      //out.print("db 접속 성공");
   }catch(Exception e){
      e.getMessage();
   }
%>