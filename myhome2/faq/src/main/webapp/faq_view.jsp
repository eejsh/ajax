<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ 리스트 등록</title>
<script>

function faqcheck(no) {
	
	if(no==1){ //리스트로 이동
	 location.href='faq_list.html';	
		
	}
	else{ //저장
		
		if(frm.fcate.value==""|| frm.fcate.value=="5"){
			alert("카테고리를 선택해주세요");
		}else if(frm.faq_qc.value==""){
			alert("질문내용을 입력해주세요");
			
		}else if(frm.faq_aw.value==""){
			alert("답변내용을 입력해 주세요.");
			frm.faq_view.focus();
			
		}else{
			
// 			   var fshow = document.getElementById("fshow");
// 	            var fshow2 = document.getElementById("fshow2");
// 	            if(fshow.checked){
// 	               fshow2.value="Y";
// 	            }else{
// 	               fshow2.value="N";
// 	            }
	            
	            
// 	            f.submit();
			
			
			
// 			var faq_view = document.getElementById("faq_view");
			
// 			if(faq_view.checked){
// 				faq_view.value="Y";
// 			console.log(faq_view.value); //체크함
		
// 			}else{
// 				faq_view.value="N";
// 			console.log(faq_view.value);  //체크안함
		
// 			}
			
			
			
			frm.method ="POST";
		//	frm.action="faq_writeok.do"; 입력부분으로감..
		 	
			frm.action="faq_updateok.do";
		 	
			frm.enctype="application/x-www-form-urlencoded";
		    frm.submit();
		    
		}
		
	}
	
	
}
	
function del_faq(){  // 데이터 삭제 페이지 연결
	//파라미터는 get으로 전송!

	if(confirm("해당 내용을 삭제 하시겠습니까? 데이터 삭제 시 복구되지 않습니다.")){
	var url = window.location.search;
	var inx = url.split("?inx=");
	console.log(inx[1]);
	
	location.href='./faq_del.do?inx='+inx[1];
	}
	
}

</script>
</head>
<body>


<p>faq 입력 페이지 </p><br>
<form name="frm" id="frm">
<input type="hidden" name="inx" value="<%=request.getAttribute("inx")%>">
<%
String cate =(String)request.getAttribute("fcate");
String cate1=null;
String cate2=null;
String cate3=null;
String cate4=null;
String cate5=null;

switch(cate){
case "0" :
	cate1 = "selected";
	break;
case "1" :
	cate2 = "selected";
	break;
case "2" :
	cate3 = "selected";
	break;
case "3" :
	cate4 = "selected";
	break;
case "4" :
	cate5 = "selected";
	break;
	
}
//!!서블릿에서 넘어올 경우!!
// (서블릿)requset로 받았을때 : Type mismatch: cannot convert from Object to String 
//request.getAttribute : Enumeration(자료형) 별도의 자료형 형태로 넘어옴->(String)선언해줘야됨
%>
카테고리 : 
<!-- onchange 카테고리 선택시 값이 변경시 onchange 로 설정 -->
<select name="fcate">
<option value="">카테고리를 선택하세요</option>
<option value="0" <%=cate1 %>>배송문의</option> 
<option value="1" <%=cate2 %>>반품/교환/환불</option>
<option value="2" <%=cate3 %>>주문/결제</option>
<option value="3" <%=cate4 %>>회원서비스</option>
<option value="4" <%=cate5 %>>안전거래</option>
</select>
<%
String ck = (String)request.getAttribute("faq_view");
String check = "";
if(ck=="Y"){
check = "checked";
}

%>

<label>
<input type="checkbox" name="faq_view" id="faq_view" value="Y" <%=check %>>리스트 출력여부</label> 
<br>
글쓴이 : <%=request.getAttribute("fwrite") %> <br>
질문내용 <input type="text" name="faq_qc" value="<%=request.getAttribute("faq_qc")%>"><br>
답변내용 <textarea name="faq_aw" rows="10" cols="200">
<%=request.getAttribute("faq_aw")%>
</textarea>
<br>
<input type="button" value="FAQ삭제" onclick="del_faq()"> 
<!--backend 파일만 있으면됨 html 파일 필요없음, 삭제할 파라미터값만 필요함. 자바스크립트로 스플릿해서 끌어와야됨.  -->

<input type="button" value="FAQ리스트"  onclick="faqcheck(1)" >
<input type="button" value="FAQ수정완료"  onclick="faqcheck(2)" >

</form>

</body>
</html>