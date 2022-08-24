<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="./config.jsp" %>
  <%
  
  request.setCharacterEncoding("utf-8");
  response.setContentType("text/html; charset=utf-8");
  
  String sql = "select * from reserve_ex order by ridx desc";
  
  PreparedStatement ps = con.prepareStatement(sql);
  ResultSet rs = ps.executeQuery();
  
  ArrayList<Map<String, Object>> al = null;
  
  try{
	 al  = new ArrayList<>();
  
  while(rs.next()){
	Map<String, Object> mp = new HashMap<>();
	
	mp.put("ridx", rs.getString("ridx"));
	mp.put("rname", rs.getString("rname"));
	mp.put("remail", rs.getString("remail"));
	mp.put("rapply", rs.getString("rapply"));
	
	  al.add(mp);
	  
  }
  
  }catch(Exception e){
	  out.print("db연결실패 테이블 오류.. ");
  }finally{
	  if(con!=null){
		  con.close();
	  }
  }
  
  %>  
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>card_list view</title>
</head>
<body>
<table border="1px solid black" cellspacing= "0"; cellpadding: "0"; style="text-align: center"; >
<tr>
<td width="50px;">번호 </td>
<td width="100px;">신청인 </td>
<td width="200px;">이메일 </td>
<td width="200px">신청방법</td>
<td width="150px">수정/삭제</td>
</tr>

<%
int w=0;
if(al.size()==0){
%>
<td colspan="5" >등록된 신청자가 없습니다.</td>

<%
}else{
	

while(w<al.size()){
%>
<form name="f" id="f">
<input type="hidden" name="ridx1" value="<%=al.get(w).get("ridx") %>">
<tr>
<td width="50px;" name="ridx" id="ridx"><%=al.get(w).get("ridx") %></td>
<td width="100px;"><%=al.get(w).get("rname") %></td>
<td width="200px;"><%=al.get(w).get("remail") %></td>
<td width="200px"><%=al.get(w).get("rapply") %></td>
<td>
<input type="button" value="수정" onclick ="update(<%=al.get(w).get("ridx") %>)">
<input type="button" value="삭제" onclick ="delete1(<%=al.get(w).get("ridx") %>)">
</td>
</tr>
<%
w++;

}
}
%>
</table>
</form>

<br>

<input type="button" value="실업급여신청" onclick ="ok()">

</body>
</html>


<script>



function update(noup) {
	
	if(confirm("해당 내용을 수정하시겠습니까? ")){
//	location.href="./~~~~~~~~~.. del.jsp//?ridx="+noup;
	}
	console.log(noup);
	
}

function delete1(node) {
	if(confirm("해당 내용을 삭제하시겠습니까?데이터 삭제시 복구되지 않습니다. ")){
		location.href="./del.jsp?ridx="+node;
	}
}
</script>


