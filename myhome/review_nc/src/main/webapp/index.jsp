<%@page import="config.dataload"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 리스트 출력 파트</title>
</head>
<body>
<%-- <% : jsp 로드 --> --%>


<%
//컨트롤에서 뷰한테 던저줌

ArrayList<dataload> list = (ArrayList<dataload>)request.getAttribute("list"); 

//jsp는 모듈이 없기 때문에 로드해줘야됨.  = import, arraylist, dataload 불러옴
for(dataload aa : list){

%>

고유값 : <%=aa.getmidx() %>
고객명 : <%=aa.getmid() %>
상품명 : <%=aa.getmgrade() %>

<%
}

%>

</body>
</html>