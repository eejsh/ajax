<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- index.jsp에서 로드함 -->

<!-- <form name="f" id="f" method="post" enctype="application/x-www-form-urlencoded" action="./mailto.jsp"> -->

<form name="f" id="f" method="post" enctype="application/x-www-form-urlencoded" action="./mail2.jsp">
<div>
<ul>
<li>
<input type="hidden" name="admin" value="메일"><br>
메일주소(받는분) : <input type="text" name="postmail"><br>
제목 : <input type="text" name="postsubmail"><br>
메일내용 : <textarea col=60 row=10 name="postmsg"></textarea><br>
<input type="button" value="메일전송" onclick="ok()">



</li>
</ul>
</div>
</form>
<script>

function ok() {
	f.submit();
	
}
</script>
