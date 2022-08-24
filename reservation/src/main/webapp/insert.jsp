<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "./dbconfig.jsp" %>
<!-- 접속확인..  -->
<% 

request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");


String sql = "insert into reservation (ridx, rnm, rpw, rno, remail, rtel, rperson, rindate) ";
       sql +=" values ('0',?,?,?,?,?,?,?)";
   
  //rindate : 예약등록일자
  //등록일짜는 오늘 날짜 이후로 해야됨. 그 전날짜 선택되면 버그.. today~사용
  PreparedStatement ps = con.prepareStatement(sql);
  ps.setString(1, "강괌촨"); //sql에 직접 변수 넣으면 필요없음
  ps.setString(2, "kang1111");
  ps.setString(3, "220824");
  ps.setString(4, "kang@kang.com");
  ps.setString(5, "01085207410");
  ps.setString(6, "9");
  ps.setString(7, "2022-08-24 12:30:00");
  
  out.print(ps);
// 인서트 전에 select 해서 중복 데이터 걸러주고 넣어줘야됨.. (예악시스템)

  int n = 0;
  n= ps.executeUpdate();

  if(n>0){
	  out.print("올바르게 저장되었습니다.");
  }else{
	  out.print("올바른 값이 아닙니다.");
  }
  
  

%>








<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>외부 DB 데이터 입력 페이지</title>
</head>
<body>

</body>
</html>