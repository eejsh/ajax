<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문자발송 시스템</title>
</head>
<body>
<%

String no ="123456";

%>
<form name="f" id="f" method="post" action="security.jsp">
<input type="hidden" name="method" value="2">
수신자번호 : <input type=text" name="receivePhone"><br>
<%-- 문자메세지 내용 : <input type="text" name="smsContent" value="<%=no %>" maxlength="50"><br> --%>
<input type="hidden" name="userDefine">
<input type="button" value="인증번호받기" onclick="ok()"> 

</form>

</body>
</html>

<script>

function ok() {
	f.submit();
	
}

</script>

<!-- SMS 아이디 : <input type="text" name="smsID"><br> -->
<!-- SMS 패스워드 : <input type="text" name="hashValue"><br> -->
<!-- 발신자번호 : <input type="text" name="senderPhone"><br> -->
