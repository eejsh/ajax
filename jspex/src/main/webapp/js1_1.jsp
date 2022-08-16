<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js1_session 생성</title>
</head>
<body>

<%

//String usernm = request.getParameter("");
//String usernm = rs.getString("필드값");

//request.setAttribute(name, o);
//request.getAttribute(name);



String user = "hong";
String email = "hong@gmail.com";
int level = 4;

//httpsession
//setAttribute :생성
			
session.setAttribute("mid", user); 	//(사용할 아이디, value 값);
session.setAttribute("mail", email);
session.setAttribute("lv", level);


long create = session.getCreationTime();   // 세션 생성 시간
long last = session.getLastAccessedTime(); // 세션 유지 시간
long usertime =(last-create) / 60000;      // 세션 경과 시간 (로그인 경과시간)

// MaxInactiveInterval : 기본이 1800초
// session.setMaxInactiveInterval(-1); // 무한으로 지정(로그아웃 시 삭제됨)
// session.setMaxInactiveInterval(0);  // 소멸
session.setMaxInactiveInterval(60*60); // 최대시간을 조정하는 부분.
int time = session.getMaxInactiveInterval()/60;   //session 사용이(60)30분 동안 유지 (은행, 공공기관)보안이 중요한 사이트인 경우 계속 넣어줘여됨. 
													//페이지 이동→초기화→30분유지

out.print(time + "<br>"); 
out.print(create + "<br>");
out.print(last + "<br>");
out.print(usertime + "<br>");


%>


</body>
</html>