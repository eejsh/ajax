<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 - Action 태그 활용</title>
</head>
<body>
<!-- <jsp:/> : jsp 액션 태그 -->
<!-- jsp태그는 열고, 닫기를 해야함-->

<!-- JSP 태그 사용형태 : server + client 쪽에 명령를 적용할 수 있음.  -->

<%-- <%@ inclued> : --%> <!-- page를 불러오기만 함. (어떤 데이터를 전송시키는건 안됨. 불러오기만 됨. ) -->


<%-- <jsp:forward page="ex17_1.jsp"/> --%>
<!--  jsp: forward : 다른 페이지로 이동과 같은 페이지 흐름을 제어합니다-->


<jsp:include page ="ex17_1.jsp" flush="false"/>
<!--  jsp:include : 외부 페이지의 내용을 포함하거나 페이지를 모듈화 합니다.  -->
<!-- </jsp:include> , flush="false/>(축약) 닫기. -->


<p>테스트 입니다. </p>


</body>
</html>