<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 3일차 - JAVA + JSP</title>
<%!
Package aaa;
public class abc {   //controller
		String a = "홍길동";
		String b = "이순신";
		String zz = null;
		public String[] getter() {
			String data[] = new String[2];
			data[0] = a;
			data[1] = b;
			return data;

		}
		public void setter(String z){
	//setter에 값을 적용 후 전산 처리 , 산술처리가 완료되면 this로 값을 보냄. (getter로 보낸 후 jsp로 출력..)
			
			this.zz=z;
			
		}public String getter2(){  //JSP 출력 역활
			return this.zz;
		}

	}
	%>
<%
abc aa = new abc();
String result[] = aa.getter();
//out.print(result);
request.setAttribute("result0", result[0]);
request.setAttribute("result1", result[1]);
aa.setter("유관순");

String name2 = aa.getter2();


%>

</head>
<body>
<!-- view -->
고객명 : <%=result[0] %> <%=result[1] %> <br>
고객명 : ${ result0 }  ${ result1 }<br>
리턴 값 이름 : <%=name2 %>
<br>
<!-- 응용문제
고객명 : 홍길동, 이순신
 -->
</body>
</html>