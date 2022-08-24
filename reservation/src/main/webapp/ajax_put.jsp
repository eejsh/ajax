<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax 통신 - ajax.java 연동</title>
</head>
<body><!-- 
ajax에는 post, get, put, delete, head..
post : 값 전송
get : 값전송+파라미터값
put: 갱신
delete : 삭제
 -->

</body>
</html>

<script>

/*
 put : get+post 형태 입니다.  단, servlet에 한정되어 있습니다.
 servlet에 doPut 메소드가 있어야만 적용됩니다.
 
 */
 
 
//ajax 예제 : 간결화

//put 기능 형태로 보내는 코드
// put = get, post 특성 둘다 가지고있음. 

var data="hong";
//var data = "?id=hong";
var ajax;
var ajax = new XMLHttpRequest();
ajax.open("put","./ajax.jsp?id="+data,true);
//ajax.open("put","./ajax.jsp" + data ,true);
//ajax.open("get..."), put이랑 같음.

ajax.send();

//get : ./ajax.jsp?id= " "+파라미터 
//post : ajax.send(data);

ajax.onload= function() {
if(ajax.status==200){
	console.log(ajax.response);
}
}

/*
 if(ajax.status==200){
	if(ajax.response=="ok"){
		alert("해당아이디는 중복됩니다.");
	}else{
		alert("해당아이디는 사용가능합니다.");
	}
}
*/



</script>