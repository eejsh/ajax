<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage ="./error.jsp"%>
    <!-- errorPage : 코드 또는 DB 또는 servlet  등 다양한 오류 발생 시 해당 페이지로 이동 시키게 됩니다.
   
    500,404,401.. 등 자주사용되는 오류코드는 외우는게 편함..
    web.xml 에 error 코드를 입력하여 페이지가 로드 되도록 설정 합니다.   
ex)   <error-page> ,, 코드에러
  <error-code>500</error-code>
  <location>/error500.jsp</location>
  </error-page>
  
    <error-page> 파일경로 에러
  <error-code>404</error-code>
  <location>/error404.jsp</location>
  </error-page>
    -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - page 디렉티브</title>
<!-- 에러 디렉티브를 자주 사용함 ! -->
</head>
<body>
<%-- <%=request.getParameter("test").toUpperCase()%> --%>
<%-- <%=request.getParameter("test").relace("",""); %><!-- 강제에러냄! --> --%>
</body>
</html>