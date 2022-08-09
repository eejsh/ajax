<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - JSP 응용</title>
</head>
<body>
	<!-- 응용문제
사용자가 숫자 1부터 9까지를 선택합니다. 해당 숫자를 선택 후 전송버튼을 클릭 시 해당 숫자의 맞는 구구단을 출력하시오.  -->

	<%
	request.setCharacterEncoding("UTF-8");
	String user = request.getParameter("gugu"); //select name = gugu 값 가져오기
	if (user != null) {
	%>
	<table border="1">
		<%
		int g = Integer.parseInt(user);
		for (int i = 1; i <= 9; i++) {
		%>
		<tr>
			<td width=100 height=30><%=g%> * <%=i%> = <%=g * i%></td>
		</tr>

		<%
		}
		%>
	</table>
	<%
	} else {
	%>
	<form name="f" id="f" method="post" action="./ex9.jsp">

		<select name="gugu">
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
		</select> 
		<input type="submit" value="구구단">

	</form>
	<%
	}
	%>
</body>
</html>