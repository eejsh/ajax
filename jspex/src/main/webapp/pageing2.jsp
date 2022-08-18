<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./db.jsp"%>
<%

int pageview = 3; //1페이지당 보여지는 데이터 갯수  
int startpage = 0; //시작페이지 값
int pagenumber = 1; //페이징 갯수

request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");

String pt = request.getParameter("search");

//int pgno = Integer.parseInt(request.getParameter("page")); //페이징번호 파라미터
String pgno = request.getParameter("page");
//인트 단점은 파라미터의 값이 없으면 오류남. string으로 받아서 숫자로 처리해야되는 경우 integer.parseint로 변환하는게 좋음


String andsql = "";  //검색 시 사용
if (pt==null) { //pt의 값이 없으면 전체 리스트 출력됨 String ct = "select count(*) as ct from poll"+ ""; 이되므로 전체출력!
 andsql ="";   //sql문법 상 띄어쓰기가 적용 되도록 하기 위함.
 
}
else {
 andsql= " where id ='"+ pt +"' "; //sql 문법 추가시에도 띄어쓰기 확인!!!
}

//String ct = "select count(*) as ct from poll"  ; //데이터 총 갯수가 먼저 실행되어야 함..

String ct = "select count(*) as ct from poll"+andsql;

PreparedStatement psct = null;
PreparedStatement ps = null;
List<Map<String, Object>> data = null;

int total = 0;

try {

	psct = con.prepareStatement(ct);
	ResultSet rsct = psct.executeQuery();

	while (rsct.next()) {
		total = rsct.getInt("ct");  //전체 db의 갯수 파악

	}

	//페이지 설정하기
	if(pgno==null || pgno==""){
		startpage=0;
	}else{ //페이지 2번부터 적용되는 사항
		startpage=(Integer.parseInt(pgno)-1)*pageview;

	}

	//페이징 총 갯수 파악
	if(total%pageview==0){
		pagenumber = total/pageview;
	}else{
		pagenumber = (total/pageview)+1;
		
	}

//	String sql = "select * from poll order by idx desc limit '"+startpage+"','"+pageview+"' "; //데이터 리스트 (limit 0,pageview  : 0,데이터갯수)
//	String sql = "select * from poll order by idx desc limit ?,?"; //데이터 리스트 (limit 0,pageview  : 0,데이터갯수)
	
  String sql = "select * from poll "+andsql+" order by idx desc limit ?,?";

	ps = con.prepareStatement(sql);

	ps.setInt(1, startpage);
	ps.setInt(2, pageview);	
	
	//sql 에서 limit 0, ? ; ? 사용시 자료형에 맞춰서 값을 넣어줌. 
	//페이지 갯수 limit0, pageview , ps.setint(1,pageview);페이지넘버 출력방식 2가지
	
	ResultSet rs = ps.executeQuery();
	data = new ArrayList<>();

	while (rs.next()) {

		Map<String, Object> mp = new HashMap<>();
		mp.put("idx", rs.getString("idx"));
		mp.put("usernm", rs.getString("name"));
		mp.put("userid", rs.getString("id"));
		mp.put("usertel", rs.getString("tel"));
		mp.put("indate", rs.getString("indate").substring(0, 10));

		data.add(mp);
	}

} catch (Exception e) {

}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 8일차 - 페이지 번호 및 검색 기능</title>
<style>
ul, ol {
	list-style: none;
	margin: 0;
	padding: 0;
	width: 1000px;
	height: 30px;
	font-size: 13px;
}

li {
	float: left;
	background-color: #ccc;
	height: 30px;
	line-height: 30px;
	text-align: center;
}

.bgcolor {
	background-color: #fff;
}

.t_ul>li:nth-of-type(1) {
	width: 100px;
}

.t_ul>li:nth-of-type(2) {
	width: 200px;
}

.t_ul>li:nth-of-type(3) {
	width: 200px;
}

.t_ul>li:nth-of-type(4) {
	width: 300px;
}

.t_ul>li:nth-of-type(5) {
	width: 200px;
}
</style>
</head>
<body>

	<ul class="t_ul">
		<li>번호</li>
		<li>고객명</li>
		<li>고객아이디</li>
		<li>전화번호</li>
		<li>입력일자</li>
	</ul>
	<em style="clear: both;"></em>

	<%
	int dw = 0;
	int no = 0;
	do {
		
		no = total-startpage-dw;
		
	%>

	<ul class="t_ul" style="clear: both;">
		<li class="bgcolor"><%=no%></li>
		<li class="bgcolor"><%=data.get(dw).get("usernm")%></li>
		<li class="bgcolor"><%=data.get(dw).get("userid")%></li>
		<li class="bgcolor"><%=data.get(dw).get("usertel")%></li>
		<li class="bgcolor"><%=data.get(dw).get("indate")%></li>
	</ul>

	<%
	dw++;
	} while (dw < data.size());
	%>

	<div style="width: 1000px; height: 30px; margin-top: 20px;">
		<ol style="display: inline;">
		<%
		int p=1;
		while(p<=pagenumber){
		%>
			<li onclick="pagego(<%=p %>)" style="width: 30px; border-radius: 5px; display: inline-block; cursor: pointer;"><%=p %></li>
			<!-- page이동 시 파라미터 pageing2.jsp?page='+pgno 설정하기 -->
		</ol>
<% 
p++;
		}
%>
	</div>
	<div style="width: 1000px; height: 30px; margin-top: 20px;">
		<!-- <select> 응용..!-->
		<!-- <option>고객명</option> -->
		<!-- <option>아이디</option> -->
		<!-- <option>전화번호</option> -->
		<!-- </select> -->
		<form name="f" id="f" method="get" action="./pageing2.jsp"	enctype="application/x-www-form-urlencoded">
			<input type="text" name="search" value="<%=pt %>"> <input type="submit"	value="검색">
			 <input type="button" value="전체리스트"	onclick="abc();">
		</form>
	</div>

</body>

<script>
	function abc() {
		location.href = "./pageing2.jsp";
	}
	
	
	function pagego(pgno) {
		location.href = './pageing2.jsp?page='+pgno;
	}
	
</script>
<%con.close();
%>
</html>