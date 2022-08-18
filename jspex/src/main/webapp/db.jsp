<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
   response.setContentType("text/html; charset=utf-8");
   Connection con = null;
   try{
      String d = "
      String u = "
      String user = 
      String pw = 
      Class.forName(d);
      con = DriverManager.getConnection(u, user, pw);
      //out.print("db 접속 성공");
   }catch(Exception e){
      e.getMessage();
   }
%>
