<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 데이터 처리</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>POST 전송이름</td>
			<td>POST 전송값</td>
		</tr>

		<%
	    //Enumeration :  자료형 클래스 , 배열형태로 모든 값을 받을 때 사용합니다. 단, name값에 한해 사용가능.
		//request.getParameterNames : 전송된 페이지에서 모든 name을 가져오는 부분입니다.

		Enumeration pm = request.getParameterNames(); 
		//out.print(pm.nextElement());

		String bb = null;
		int j = 0;
		while (pm.hasMoreElements()) { 
			//hasMoreElements : 해당 자료형 클래스에 있는 모드 객체요소를 가져올때 사용(buffer와 동일)
			//out.print(pm.nextElement());	:usernmuseriduserpw
			
			String aa = (String) pm.nextElement(); // name값 모두 확인하는 함수입니다.
				// ex13의 name값 = aa
			
			if(!aa.equals("userpw2")){ //pw는 한번만 필요..ㅠ 한번 걸러주기.
				//==, !=  사용못함! intern 사용불가..ㅠ equals 사용
			bb = request.getParameter(aa);  // 사용자 입력값 =bb
		
			
			request.setAttribute("code"+j, bb);  //디렉티브 태그 형태로 변환하여 반복문밖에서 출력할 때 사용.
			
		%>
		<tr>
		<td><%=aa %></td>
		<td><%=bb %></td>
		</tr>
		
		<%
		//out.print(bb);
			}
			j++;
		}
		%>
		
	</table>
	
	<span>
	${code0}
	
	</span>
	
	
</body>
</html>