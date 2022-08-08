<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 select 응용 + 배열</title>
</head>
<body>
	<!-- select 주의점 : db설계 주의! index 번호로 넘어와서 처리할시 편리할 수 있음 -->
	<%
	int cate = 4;
	%>
	<select>
		<option value="">[통신사를 선택하세요.]</option>
		<%
		String ck = "";
		for (int c = 1; c <= 4; c++) {
			if (cate == c) {
				ck = "selected";
			}
		%>
		<option value="<%=c%>" <%=ck %>>option<%=c%></option>
		<%
		}
		%>
	</select>

<br><br>

<select>
<%
for(int c=1; c<=4; c++){
// 	switch(c){
// 	case 1 :
// 	}  //스위치 사용해서 option값 넣어서 사용.
	
	if(cate==c){
	out.print("<option value='"+c+"'selected>option"+c+"</option>");
		
	}else{
		out.print("<option value='"+c+"'>option"+c+"</option>");
	}
}
%>
<option>
</option>
</select>
<br><br>
배열<br>
<!-- JSP 배열로 값을 선언 
jsp 자체로는 배열이 없음 , java 코드
-->

<%!
//java배열을 선언
String data[] = {"홍길동", "이순신", "강감찬"};  
%>
<%

//Java 배열을 가져와서 JSP 반복문으로 출력

//out.print(data.length); = 3

for(int aa=0; aa<data.length; aa++){
	out.print("<span style='border:1px solid red;'>"+data[aa]+"</span>");
	
}




%>




</body>
</html>