<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

	<!-- DB 접속 환경 :select, insert, delete시에만 사용..-->
	<%@ include file="./dbconnect.jsp"%>

	<%
	
	String sql = "select * from poll order by indate desc ";
	ArrayList<Map<String, Object>> al  = null;
	try {
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
	 	
		al = new ArrayList<>();

	 	while(rs.next()) {
		Map<String, Object> mp = new HashMap<>();
			mp.put("idx", rs.getString("idx"));
			mp.put("name", rs.getString("name"));
			mp.put("id", rs.getString("id"));
			mp.put("tel", rs.getString("tel"));
			mp.put("itext", rs.getString("itext"));
			mp.put("indate", rs.getString("indate").substring(0,10));
			
			al.add(mp);
		}

	} catch (Exception e) {

		out.print("DB연결 실패 및 테이블 오류!");
		
	} finally {
		if (con != null) {
			con.close();
		}
	}
	%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>JSP 4일차 select 연동</title>
<!-- jsp도 동일하게 dbconnect 별도로 만듬~~ -->
</head>
<body>
<%
int w=0;
while(w<al.size()){
%>
<!-- jsp 태그 사용 이유는 설문조 0~4 내용이 확인이 안됨.
switch.jsp 에서 사용자가 어떤 내용에 대한 설문조사를 응하였는지 확인하는 jsp임.

include page="switch.jsp" 로 보냄. (get(itext), name='cate' 로 보냈음..)

 -->
<jsp:include page="switch.jsp">
<jsp:param value='<%=al.get(w).get("itext")%>' name="cate"/>
</jsp:include>

<!-- switch.jsp 에서 setAttribute로 생성된 가변수명을 getAttribute로 받아서 처리 
또는 ${msg}로 바로 출력 가능! (액션태그) -->
<% 
String msg = (String)request.getAttribute("msg");
out.print(msg);
%>

	<ul>
		<li>고유번호 :<%=al.get(w).get("idx") %></li>
		<li>고객명 :<%=al.get(w).get("name") %></li>
		<li>고객아이디 :<%=al.get(w).get("id") %></li>
		<li>연락처 :<%=al.get(w).get("tel") %></li>
		<li>설문조사내용:<%=msg%></li>
<%-- 		<li>설문조사내용: ${msg}</li>   --%>
		<!-- set include 사용해서 ${msg} 사용가능! -->
		<li>참여일자 :<%=al.get(w).get("indate") %></li>
	</ul>

<%
w++;
}
%>


</body>
</html>