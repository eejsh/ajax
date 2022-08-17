<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>js1_session 확인</title>
</head>
<body>

<% 

//attribute -> object로 받음, string으로 변환.

session.setMaxInactiveInterval(60*60);  //페이지 이동시 초기화

//페이지 이동시에도 로그아웃전에는 유지시켜주려면 setmaxinativeinterval 유지
//setattribute 1회 적용 후 setmax~interval session이랑 같이 include 로 로드시켜면 됨, 단 상단에만 설정하면됨.

Object id = session.getAttribute("mid");
Object lv = session.getAttribute("lv");
String mail = (String)session.getAttribute("mail");


/*!!!session이 null이 된 경우, login page로 보내기. object보단 string, int사용해야 if문 사용하기 편함 */
if((String)mail==null){
	out.print("<script>alert('시간경과로 자동 로그아웃 되셨습니다.'); location.href='./js1.jsp'; </script>");
}


//session.setMaxInactiveInterval(10*60); 
//1*60 =1분, 10*60 =10분 일반적인 쇼핑몰은 20*60 =15~20분?? 
//단, 내부시스템은 1시간 정도 잡아줌.(세무회계재무 등등)

out.print(id+"<br>");
out.print(lv+"<br>");
out.print(mail);

//실질적으로 사용안함. 셋팅 시간확인용.. 세션세팅확인용! 시간 늘리거나 줄일때 확인하고 변경~~
int time = session.getMaxInactiveInterval();
out.print(time);


%>

</body>
</html>