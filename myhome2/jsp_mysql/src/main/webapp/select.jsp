<%@page import="javax.jws.HandlerChain"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSP 4일차 SQL 연동</title>
<!-- jsp도 동일하게 dbconnect 별도로 만듬~~ -->
</head>
<body>
<!-- DB 접속 환경 :select, insert, delete시에만 사용..-->
<%@ include file = "./dbconnect.jsp" %>

<%
try{
	String sql = "select * from poll "; //sql 문법
	PreparedStatement ps = con.prepareStatement(sql); //sql 문법을 실행 시키는 클래스
	ResultSet rs = ps.executeQuery(); //select에서만 Resultset 사용 : 값을 받아서 처리하는 클래스
	
//	out.print(rs.next());
	
	while(rs.next()){  //sql 에 있는 데이터를 반복시킴.
	//DTO=getter, setter 없음..ㅠ
	
	//	out.print(rs.getString("id"));
	
	//getString(): 문자 불러오기
	//getInt(): 숫자 ,(금액찍을때 int로 받음!, double :외화 때 사용...ㅋ)
	//getBoolean : true, false..
	//getfloat    ...등
	
	
	%>
	
<ul>
<li>고유번호 : <%=rs.getString("idx") %></li>
<li>고객명 : <%=rs.getString("name") %></li>
<li>고객아이디 : <%=rs.getString("id") %></li>
<li>연락처 : <%=rs.getString("tel") %></li>
<li>설문조사내용: <%=rs.getString("itext") %></li>
<li>참여일자 : <%=rs.getString("indate").substring(0,10) %></li>
</ul>
	<%
	}
	
}catch(Exception e){
//	e.getMessage();
	out.print("DB연결 실패 및 테이블 오류!");
}finally{
	if(con!=null){  //DB 연결 및 출력 모두 완료되면 DB연결접속 해제
		con.close();
	}
	
}




%>

</body>
</html>