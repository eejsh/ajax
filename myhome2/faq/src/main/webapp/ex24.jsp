<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 사용자입력페이지</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");
	String aa = request.getParameter("abc").intern();
	request.setAttribute("aa", aa);
	%>

	<form name="f" id="f" method="post" action="./ex24.jsp">
		<p>사용자 입력 페이지</p>
		<input type="text" name="abc"> <input type="submit" value="전송">
	</form>

	<%
	if (aa == "딸기") {
		String aa1 = "해당상품은 판매 종료된 상품입니다.";
		request.setAttribute("aa1", aa1);

	} else if (aa == "포도") {
	%>
	<%@include file="ex24_1.jsp"%>
	<%
	} else {
	String aa1 = "상품명을 다시 한번 확인해 주세요.";
	request.setAttribute("aa1", aa1);
	}
	%>


	<!-- 출력 -->
	<%=aa%><br> ${aa1}
	<br>






</body>
</html>