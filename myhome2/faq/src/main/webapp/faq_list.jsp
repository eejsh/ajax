<%@page import="process.select_sql"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>FAQ 리스트 출력</title>
<link rel="stylesheet" type="text/css" href="./css/faq.css?v=8">
<script>
function faq_write(){
	
	location.href='./faq_write.html';
	
}


function modify(inx){
	
	location.href ='./faq_view.html?inx=' + inx;
			
	}


</script>


</head>
<body>
<%ArrayList<select_sql> datas = (ArrayList<select_sql>)request.getAttribute("list");
%>


<section class="faq_view">
	<div class="faq_list">
		<p>FAQ LIST</p>
		<span class="faq_content">
			<ul>
				<li>카테고리</li>
				<li>제목</li>
				<li>글쓴이</li>
				<li>등록일자</li>
			</ul>
		</span>
		<% if(datas.size()==0){ %>
		<span class="faq_content_view">
			<ul class="nodata">
				<li>등록된 FAQ가 없습니다.</li>
			</ul>
		</span>
		<% } else { 
	for(select_sql fetch : datas){
			int num = Integer.parseInt(fetch.getFcate());
			//별도의 jsp 파일 만들어서 사용 할 수 있음
			String cate = null;
			switch(num){
			case 1:
				cate = "배송문의" ;
				break;
			
			case 2: 
				cate = "반품/교환/환불" ;
				break;
			
			case 3:
				cate = "주문/결제" ;
				break;
			
			case 4:
				cate = "회원서비스" ;
				break;
			
			case 5:
				cate = "안전거래" ;
				break;
			}
		%>	
		<span class="faq_content_view" onclick="modify(<%=fetch.getinx() %>)" >
			<ul>
<%-- 			<li><%=fetch.getFcate() %></li> --%>
				<li><%=cate %></li>
			
				<li class="left_text"><%=fetch.getFaq_qc() %></li>
				<li><%=fetch.getFwrite() %></li>
				<li><%=fetch.getIndate() %></li>
			</ul>
		</span>
			<%
				}
			}
		%>
		
		
	</div>
	<div class="pageing">
	<ol>
	<li>1</li>
	</ol>
	</div>
	<div class="page_btn">
	<input type="button" value="FAQ 등록" class="faq_btn" title="FAQ 등록" onclick="faq_write();">
	</div>
</section>
</body>
</html>
