<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="./dbconnect.jsp" %>
<%
request.setCharacterEncoding("utf-8");
String mid = request.getParameter("name11").replaceAll(" ", ""); 
String mname = request.getParameter("id11").replaceAll(" ", "");  
//공백 제거! 전체단어를 검토 (" ","")공백이 있으면 없애버림, 전화번호 등..      


String mtel = request.getParameter("tel11").intern(); //전화번호검토

//한개이상 과일. 취미.. checkbox getparameter로 받으면 절단..ㅠ



if(mtel.length()< 10){
	out.print("<sciprt>alert('올바른 값이 아닙니다.'); history.go(-1)</script>");
}else{
//이미 참여 한 고객이 있으면 걸러줘야됨! select로 고객 id 검색 후 else에 insert넣어주면 됩니다.
//한번만 참여가 가능하도록 하는 확인 작업입니다. 	
	String sql = "select * from poll where id ='"+mid+"' ";
	
	PreparedStatement ps = null;
	try{
		
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		out.print(rs.next());  //trun 가 뜨면 아이디가 있음.
		
		if(rs.next()==true){
			out.print("<script>alert('이미 설문조사에 참여 하셨습니다.'); history.go(-1); </script>");
			
		}else{
			//insert
		}
		
		
		
	}catch(Exception e){
		
		
	}finally{
		
	}
	
}








%>


</body>
</html>