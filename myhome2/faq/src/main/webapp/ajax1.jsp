<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 2일차 - AJAX 통신</title>

<script>

function ajax() {
	
	var id = document.getElementById("mid").value;
	
	if(id.value==""){
		alert("아이디를 입력하세요.");
	}else{
	var aj;
			function wck() {
				
				if(window.XMLHttpRequest){
				   
					return new XMLHttpRequest();
					
				}
				
			}
			function acall() {
			if(aj.readyState == XMLHttpRequest.DONE && aj.status==200){
				// js.put으로 태워서 response 될 경우 parse선언필수
				var data = JSON.parse(this.response);
				console.log(data);
				console.log(data["mid"]);
				console.log(data["mname"]);
				
// 				if(this.response=="no"){
// 					alert("해당 아이디는 사용 할 수 없습니다.");
// 					console.log(this.response);
// 				}else{
// 					alert("해당 아이디는 사용가능 합니다.");
// 					console.log(this.response);
// 				}
				}
			}
			
		//	var gopage = "./ajax1_ok.jsp?mid="+id;
			
	//var gopage = "http://192.168.100.204:8080/faq/ajax1_ok.jsp";
	
	var gopage = "http://192.168.100.203:8080/faq/data.jsp?apikey=aaaa";
			aj = wck();
			aj.onreadystatechange=acall;
	     	aj.open("GET", gopage, true);  //url
			aj.send();

		}
	}



</script>

</head>
<body>


<input type="text" name="mid" id="mid">
<input type="button" value="중복확인" onclick="ajax();">

</body>
</html>