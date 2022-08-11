<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멀티 파일 저장 (ex28.jsp)</title>
</head>
<body>

<%
//서버에 대한 절대 경로를 출력 하는 형태 입니다. (본 서버에는 해당 라인 적용)
String url = request.getServletContext().getRealPath("upload");

//연습 경로
//String url ="C:\\myhome2\\faq\\src\\main\\webapp\\upload";

//

int maxsize = 1024*1024*2;
String lang ="utf-8";

MultipartRequest m = new MultipartRequest(request, url, maxsize, lang, new DefaultFileRenamePolicy());
Enumeration em = m.getFileNames();

String file1 =(String)em.nextElement();
String allfile = m.getFilesystemName(file1);
out.print(allfile);

String file2 =(String)em.nextElement();
String allfile2 = m.getFilesystemName(file2);
out.print(allfile2);

String file3 =(String)em.nextElement();
String allfile3 = m.getFilesystemName(file3);
out.print(allfile3);

%>

</body>
</html>