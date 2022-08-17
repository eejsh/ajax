<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fm" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="dbinfo" tagdir="/WEB-INF/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 7일차 -tagdir 응용편</title>
</head>
<body>

<%-- <dbinfo:table></dbinfo:table>  해당 tag 안에 있는 값을 jsp 에서 외부로 가져오기는 힘듬니다.. --%>
<%-- <span><%=request.getAttribute("userid") %></span> setAttribute로 강제로 값을 끌고 올 수는 있음..  --%>

<!-- taglibs 라이브럴 파일 중 spec.jar 이 있어야만 tag파일과 return 값을 받을 수 있음  -->


<dbinfo:table2 no="50" no2="홍길동님 환영합니다."></dbinfo:table2>
리턴값 : ${returncall} <br>
리턴값 : ${returncall2} <br>





</body>
</html>