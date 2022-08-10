<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP include 형태, 17_1.jsp연동 // ex19</title>
</head>
<body>

<p>해당 페이지는 ex19.jsp 페이지입니다. </p>
<jsp:include page="./ex17_1.jsp" flush="false"></jsp:include>

<!-- 자신의 결과값 또는 HTML 코드 등 출력 하며, 외부 파일의 jsp도 출력 합니다. -->
<!-- flush : 
false(외부파일에 사용되는 버퍼를 지우지 않음.)

true(외부파일로 제어가 이동할 때 지금까지 출력 된 버퍼에 저장된 내용을 웹브라우저에 출력하고 버퍼를 지움. )-->



</body>
</html>