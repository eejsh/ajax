<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 - 반복문 응용</title>
</head>
<body>

<!-- 절대 하지말아야 할것!! : JSP 코드에 HTML 태그를 넣지 않음!!!! -->
	<!-- 더블 반복문을 이용하여 현재 테이블처럼 제작 합니다. 
각각의 칸 크기는 100 * 30 입니다. -->

	<table border="1" cellpadding="0" cellspacing="0" >
		<%
		for (int f = 0; f < 4; f++) {
		%>
			<tr>
		<%
		for (int ff = 0; ff < 4; ff++) {
		%>
			<td width="100px" height="30px">
			</td>
		<%
		}
		%>
		</tr>
		<%
		}
		%>
	</table>
<br><br>
<!-- 반복문을 이용하여 짝수칸에만 색상이 들어가는 테이블을 작성하시오. 단, 한칸당 크기는 300*30-->

<table border="1" cellpadding="0" cellspacing="0" >

<%
String aa=null;
for(int a=1; a<9; a++){
%>
<tr>
<%
if(a %2 ==0){
	aa = "orange";
}
else{
	aa = "";
}
%>
<td width="300" height="30" bgcolor="<%=aa%>"></td>
</tr>
<%
}
%>
</table>

<br>
<!--//// -->

<table>
<%
int w =1;
String bgcolor ="";

while(w<=8){
	%>
<tr>
<%
	if(w %2==0){
		bgcolor="pink";
	}
	%>

<td width="300" height="30" bgcolor="<%=bgcolor%>"></td>
</tr>

	<%
	w++;
}
%>


</table>




</body>
</html>