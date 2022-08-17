<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 session</title>
</head>
<%@include file = "./js1_2.jsp" %>
<body>
<!-- 
client에 대한 정보를 저장하여 서버와 통신하면서 페이지 이동 시 지속적으로 사용 가능하도록 하는 객체 입니다.(정보유지) 
session, cookie 저장.이용방식이 다름

※ chrome에서 session, cookie 가 저장 되나 Edge에는 새롭게 등럭되어야 함.(쿠키, 세션 둘다!) 

session (JSP) : 클라이언트 입력 정보 → 서버에 저장 → 브라우저에 저장하는 형태 (캐시)/보안이 중요함
    단점 : 여러 서버에서 공유 할 수 없음(통합아이디:신세계백화점-ssg닷컴같이 여러서버에는 저장안됨)
     
cookie (javasciprt, JSP, java) : 서버 에서 생성 → 클라이언트에 저장되어 사용됩니다. / 보안이 중요하지않음  
	장점 : 통합아이디 접속 가능 
	단점 : 정보노출 단계가 낮은 편

ex) session : 로그인, 메일발송 정보 , 결제 정보 등 세션 사용
	cookie : 팝업(오늘하루동안띄우지않기.), 접속자PC정보 

(../ : 한번 더 나감 ㅠ) 
(./: 같은 위치)

session은 자료형이 따로 없음 string, int 등등 다 사용가능(object)

브라우저를 종료 하지 않거나 삭제하지 않은 이상 계속 유지됨 -> 로그아웃 시 삭제!

session.setmax~~ 사용하거나 xml에서 sessionconfig 둘중 하나는 사용
 -->

<a href="js1_1.jsp">session 생성</a>
<a href="js1_2.jsp">session 확인</a>
<a href="js1_3.jsp">session 삭제</a>

</body>
</html>