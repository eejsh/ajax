<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- contentType="text/html; charset=utf=8" html에서 jsp 페이지를 적용할 때 코드라인을 사용하지 않아도 무방함. 
text/html : html 에서 jsp 출력
text/xml : xml로 변환
text/plain : 코드가 전부 출력

-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 1일차 - 반복문 1</title>
</head>
<body>
	<%
	int f;
	for (f = 1; f < 6; f++) {
	%>
	<input type="radio" name="rd" id="">설문조사<%=f%><br>
	<%
	}
	%>
	<br>

	<input type="checkbox" name="ck">전체선택
	<br>
	<%
	int w = 1;
	while (w <= 6) {
	%>
	<input type="checkbox" id="ck<%=w%>">체크<%=w%><br>
	<%
	w++;
	}
	%>

	<select>
		<option value="">메뉴를 선택해 주세요.</option>
		<%
		int dw = 0;
		do{
			
		%>	
		<option value="<%=dw%>">메뉴<%=dw%></option>
		<%
			dw++;
		}while(dw<6);
		
		%>
		
	</select>




</body>
</html>