<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String aam = request.getParameter("abc").intern();

	if (aam == "포도") {
		String a1 = "청포도 2kg ";
		int a2 = 35000;
		String a3 = "10%";

		request.setAttribute("a1", a1);
		request.setAttribute("a2", a2);
		request.setAttribute("a3", a3);

	} else {
		out.print("error");
	}
	%>
	<p>상품명 : ${a1}</p>
	<p>가격 : ${a2}</p>
	<p>할인가 : ${a3}</p>

</body>
</html>