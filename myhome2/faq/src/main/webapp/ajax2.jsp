<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP3일차 Jquery ajax 그래프+타이머+배열</title>
<script src="./js/jquery.js"></script>
<script>
	//파싱작업:배열로만듬
	//파서작업:배열로 인식하게 만듬

	$(function() {
		$.fn.weather = function() {
			var $apikey = "abc123";

			$.ajax({
				url : "./ajax2_1.jsp", //외부에서도 접속 할 수 있도록 하기 위해서는 JSON이 아닌 JSP로 값을 받도록 합니다.
				cache : false,
				dataType : "html", //JSON, XML 파일 외에는 모두 html로 적용해야 합니다.
				data : {
					apikey : $apikey
				//데이터 통신을 위해서는 APIKEY 확인합니다.
				},
				type : "GET",
				success : function($data) {
					var $jdata = jQuery.parseJSON($data); //JS JSON.parse();
					//JSON 파일이 아닌 이상은 parseJSON을 이용하여 파서 해야만 배열로 인식합니다.

					$.fn.ani($jdata); //애니메이션 파트를 별도로 사용.. function ani로 보냄.
					//console.log($jdata);
				},
				error : function() {
					console.log("AJAX 통신오류");
				}

			});

			setTimeout($.fn.weather, 5000); // 매 5초마다 데이터를 로드하게 됨.
		}

		setTimeout($.fn.weather, 1000); //최초 실행 시 적용

		$.fn.ani = function($jdata) {

			console.log($jdata.length);

			var $w = 0;
			while ($w < $jdata.length) {
				var $area = $jdata[$w]["area"];
				var $areanum = $jdata[$w]["areanum"];

				//		console.log($area + $areanum);
				// $("$dataload>span:eq(0)>ul>li:eq(1)").css("width", $areanum*2 + "px");

				$("#dataload>span:eq(" + $w + ")>ul>li:eq(1)").animate({
					"width" : $areanum + "px"
				}, 500);

				$w++;
			}

		}

	});
</script>
</head>
<body>

	<p>각 지역구 강수량</p>
	<div id="dataload"
		style="width: 700px; height: 500px; border-left: 1px solid black; border-bottom: 1px solid black;">
		<!-- 태그는 동일하게 사용.. div, span.. -->
		<!-- 강동구 -->
		<span style="display: black; width: inherit; height: 50px;">
			<ul
				style="list-style: none; margin: 0; padding: 0; width: inherit; height: inherit;">
				<li>강동구</li>
				<li style="width: 0px; height: 25px; background-color: purple;"></li>
			</ul>
		</span>
		<!-- 중랑구 -->
		<span style="display: black; width: inherit; height: 50px;">
			<ul
				style="list-style: none; margin: 0; padding: 0; width: inherit; height: inherit;">
				<li>중랑구</li>
				<li style="width: 0px; height: 25px; background-color: green;"></li>
			</ul>
		</span>
		<!-- 강남구 -->
		<span style="display: black; width: inherit; height: 50px;">
			<ul
				style="list-style: none; margin: 0; padding: 0; width: inherit; height: inherit;">
				<li>강남구</li>
				<li style="width: 0px; height: 25px; background-color: orange;"></li>
			</ul>
		</span>
		<!-- 동대문구 -->
		<span style="display: black; width: inherit; height: 50px;">
			<ul
				style="list-style: none; margin: 0; padding: 0; width: inherit; height: inherit;">
				<li>동대문구</li>
				<li style="width: 0px; height: 25px; background-color: blue;"></li>
			</ul>
		</span>
		<!-- 중구 -->
		<span style="display: black; width: inherit; height: 50px;">
			<ul
				style="list-style: none; margin: 0; padding: 0; width: inherit; height: inherit;">
				<li>중구</li>
				<li style="width: 0px; height: 25px; background-color: skyblue;"></li>
			</ul>
		</span>
		<!-- 성동구 -->
		<span style="display: black; width: inherit; height: 50px;">
			<ul
				style="list-style: none; margin: 0; padding: 0; width: inherit; height: inherit;">
				<li>동대문구</li>
				<li style="width: 0px; height: 25px; background-color: yellowgreen;"></li>
			</ul>

		</span>
	</div>
</body>
</html>