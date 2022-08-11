<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 4일차 -  멀티 데이터 전송 + substring </title>
</head>
<body>
<%

//substring 이란?   : 단어를 자르는 문법!
		
	String a = "홍길동님";
	String b = a.substring(2);              //홍=0, 길=1, 동=2, 님=3
	String c = a.substring(0,3); 
	out.println(b);  // 동님..
	out.println(c);  // 홍길동
	
	String code ="12345678";
	String recode = code.substring(0,4)+ "****"; 
	out.print(recode); //1234**** 생일, 아이피주소 같이 뒤부분만 잘라서 안보이게 해줌.

%>
<br><br>
<form name="f" method="post" action="ex28_1.jsp" enctype="multipart/form-data">
첨부파일1 : <input type="file" name="file1"><br><br>
첨부파일2 : <input type="file" name="file2"><br><br>
첨부파일3 : <input type="file" name="file3"><br><br>
<input type="submit" value="전송">
</form>


</body>

</html>