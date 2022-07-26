function idcheck(){
	
	let id = document.getElementById("mid");
	if(id.value==""){
		alert("아이디를 입력해 주시길 바랍니다.");
	 id.focus();
	 	
	}else{
		ajax(id.value);    //ajax mid로 보냄.
		}
}

function ajax(mid){
let aj;	
	function wck(){
		if(window.XMLHttpRequest){
			return new XMLHttpRequest();
		}
		
	}
	function datack(){
		if(aj.readyState==XMLHttpRequest.DONE && aj.status==200){
		//	console.log(this.response);
			if(this.response=="ok"){
				alert("해당 아이디는 사용하실 수 있습니다.");
				document.getElementById("mid").readOnly = true;    
				
			}else if(this.response=="no"){
				alert("해당 아이디는 중복값 입니다.");
			    document.getElementById("mid").value="";
				
			}
		}
	}
	var postdata = "userid=" + mid;  // 파라미터 보내듯 id값보내주기.  mid는 그대로 받고 userid를 추가하여 보내야됨. 
	aj=wck();
	aj.onreadystatechange = datack;
	aj.open("POST", "./index4.do" , true);
	aj.setRequestHeader("content-type","application/x-www-form-urlencoded");
	aj.send(postdata);
	
}

