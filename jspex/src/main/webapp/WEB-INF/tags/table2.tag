<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>

<%@ attribute name="no" required="true" type="java.lang.Integer" %>
<%@ attribute name="no2" required="false"%>
<!-- arrtibute 는 jsp에서 값을 가져올 때 사용하는 문법입니다. name 으로 태그에 있는 값을 가져옴. type 값을 가져올 때 자료형을 말합니다.
		required : true (자료형을 무조건 사용) ,false(자료형과 관계 없이 사용. false가 기본) -->
<%@ variable name-given="returncall" variable-class="java.lang.Integer" scope="AT_END"%>
<%@ variable name-given="returncall2" scope="AT_END"%>
<!-- variable: 출력여부 및 변수이름을 추가 할 때 사용합니다. (return에 사용할 이름) name=given: 값을리턴시켜줌 
	variable-class : 자료형을 구분하게 됨. 단, required false 일 경우 사용하지 않아도됨.
	scope : 출력 형태:  AT_END 태그 종료 후 출력 / AT_BEGIN : 태그 시작에 초기 값을 입력받아 출력 / NEXTED는 foreach(반복문) 사용시 적용하게 됨 -->
	



<%@ taglib prefix="aa" uri="http://java.sun.com/jsp/jstl/core" %>

<aa:set var="returncall" value="${no}"></aa:set>
<aa:set var="returncall2" value="${no2}"></aa:set>