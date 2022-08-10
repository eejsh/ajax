<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 검색 리스트 출력파트</title>
</head>

<%
//검색은 포도로 하지만 청포도 2kg 로 출력..

String product[][] = { 
		{"딸기","",""},
		{"청포도 2kg","35000","10%"},
		{"적포도 1kg","18000","5%"}
		
};

request.setCharacterEncoding("utf-8");
String pronm =request.getParameter("search").intern();

String test = product[1][0];

out.print(test);
out.print(test.indexOf(pronm)); // -1이면 값이 없음

String a_pnm = null;  //상품명
String a_pmoney =null;  //상품가격
String a_psales = null; //할인가격..

Boolean ck = false;  //검색 상품 결과 유무
%>
<!-- jsp:include 는 태그개념, name값은 절대 중복되면안됨! 
ex)param : html에 name 값을 선언한걸 깜빡하고 같은 name값을 선언해서 충돌되는 경우가 많음.ㅠ -->
<!-- 지속적으로 검색을 할 수있도록 하기 위함 -->
<!-- 검색 받은 값을 리턴 시킴. -->


<jsp:include page="ex24_01.jsp"> 
<jsp:param value="<%=pronm %>" name="search"></jsp:param>
</jsp:include>


<body><%
int w=0;
while(w<product.length){
//	out.print(product[w][0]);
	
if(product[w][0].indexOf(pronm)>-1){
	a_pnm = product[w][0];
	a_pmoney = product[w][1];
	a_psales = product[w][2];
	
ck = true;  //상품결과 있으면 true;
if(a_pmoney!=""){ //가격이 비어있지 않을 경우
%>
<ul>
<li>상품명 : <%=a_pnm %></li>
<li>상품가격 : <%=a_pmoney %></li>
<li>할인율 : <%=a_psales %></li>
</ul>
<% 

}
else{  //가격이 비어있을 경우
	out.print("<span>해당 상품은 판매 종료된 상품입니다. </span>");

}
};
w++;
}
%>
<%

if(ck==false){  //모든 배열을 반복 하였지만 해당 값을 확인 하지 못할 경우.

	out.print("<span>상품명을 다시 한번 확인 해 주세요.</span>");
	
%>
<%
}
%>




</body>
</html>
