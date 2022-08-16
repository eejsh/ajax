<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 6일차 javascript (정규식 코드)</title>
<script>
	function abc() {
		var z = document.getElementById("mid");

		//	var code = /java/i;  // java, i , new regex() 를 줄임.
		//	var code = new RegExp("java","i"); 
		// i : 문자열 전체를 확인(대소문자 관계없이 사용)

		//	var ck = code.exec(z.value); //exec : 자바스크립트에서 정규식 코드에 대한 데이터 리스트를 보여줍니다.
		// 	console.log(ck.index);
		// 	if(ck.index > -1){
		// 		alert("해당 단어가 있습니다.");
		// 	}
		//	console.log(ck);	

		/*숫자만 입력 받아야할 경우*/
		//a-z,A-Z,0-9
		//	var code = /[^0-9]/   //^0-9 숫자외 것  ^(not)    : true(문자들어감) false(숫자만들어감.)
		//	var code1 = /[a-z]/i ;
		//	var code1 = /[a-z|A-Z]/;
		//	console.log(code.test(z.value));  //text : true, false  ,booleam 개념
		//[] : 배열범위
		//빈 공간도 특수기호로 받음 , 
		/*한글만 입력 받아야 할 경우*/
		//ex:이름입력: 외국인은 영어, 한국인은 한글 , 유일하게 한자는 입력안됨! 한글, 영어 별도로 입력받는 이유..
		//	var code2 = /[^ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/ ;  
		//	console.log(code2.test(z.value)); 
		/*입력값 패턴별 확인사항 (-가 없이 숫자만.) 010 2345 1113 or 010 221 1234 ..*/
		//maxlength 사용안할떄!
		//	var code3 = /^[0-9]\d{9}/;     //{} 범위   
		// console.log(code3.test(z.value));
		/*특수문자 조합 [아이디]*/
		//	var code4 = /[a-z|A-Z|0-1\\d_-]/g;   //g 문자열 전체를 말함. \\d : 특수문자를 함께 사용 한다는 뜻.
		//	var ck = z.value.match(code4);     
		// match : 해당 사용자 입력값이 모두 정규식 코드 안에 있을 경우 배열로 생성됨.
		//	console.log(code4.test(z.value));
		// 	if(z.value.length!=ck.length){ // 사용자 입력코드 갯수 != code4의 설정문자갯수
		// 		alert("올바른 아이디가 아닙니다. 특수문자는 -,_ 만 사용 가능합니다.");
		// 	}
		/*특수문자 포함(패스워드)*/
		var code5 = /[a-zA-Z0-9ㄱ-ㅎ가-힣ㅏ-ㅣ]/g;
		var ck = z.value.match(code5);
		var code6 = /[ㄱ-ㅎ가-힝ㅏㅣ]/;
		console.log(code6.test(z.value));

		if (code6.test(z.value) == false) { // ^ 가 없으면 ture로 사용.
			alert("올바른 패스워드가 아닙니다.");
		} else {
			var code5 = /[^a-zA-Z0-9ㄱ-ㅎ가-힣ㅏ-ㅣ]/g;
			var ck = z.value.match(code5);

			console.log(ck);

			if (ck != null) {
				if (ck.length < 2) {
					alert('패스워드는 특수문자 2자 이상 입력하세요.');
				}
			} else {
				alert('특수문자를 넣어주세요.');

			}
		}

	}

	//정규식 코드 문법 
	// match, test, exec, replace, replaceAll, split
	
	</script>
</head>
<body>



	<input type="text" id="mid" maxlength="11">
	<input type="button" value="확인" onclick="abc()">
</body>
</html>