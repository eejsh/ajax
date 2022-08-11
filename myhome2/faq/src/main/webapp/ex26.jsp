<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page buffer="8kb" autoFlush="true" %>
    <%@page isThreadSafe="true" %>
    <!--  buffer : 페이지 읽어 들이는 메모리 사용 제한
    	  autoFlush : true(메모리를 비우고 다시 페이지를 로드), false (메모리 데이터를 비우지 않음)
    	  isThreadSafe : false(멀티스레드를 사용하지 않음), true(멀티스레드를 사용함)
    	  isThreadSafe(true)권장! from data 처리시 다중처리 시 속도를 높이기 위해서 사용 ex)여러 사람이 다발적으로 동시 접속시에 사용함!
    	   특히 데이터베이스 처리 시 무조건 사용 권장...
    -->
    <!-- buffer= 메모리 "8kb" 만 쓸수잇음.  메모리 절전 위해서 buffer 사용 , 갤러리보드.. 이미지로딩 때 주로 사용.   -->
     <!-- 글자 1개 : 1byte -->
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4일차 Buffer 사용법 + Thread</title>
</head>
<body>

<%=out.getBufferSize() %> byte 
<!-- 기본적으로 (1024*8) 8 byte -->
<%
for(int a=1; a<=500; a++){
	out.println(a);
}


%>

</body>
</html>
