<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    
    //CORS : 도메인 및 아이피가 다를 경우 외부에서 .json을 가져가지 못함.. 
    
    response.addHeader("Access-Control-Allow-Origin","*");
    response.addHeader("Access-Control-Allow-Credentials","true");
    %>
    
<%
    
//jsp에서 json 파일처럼 배열로 인식되도록 하는 클래스 입니다.


//배열로 보내달라고 요청 할 경우 jsonobject로 보내야됩니다.

JSONObject js = new JSONObject();


//ajax 통신 시 HTML코드는 별도로 사용하지 않음..
String aa = request.getParameter("mid").intern();
String bb = null;
// if(aa=="hong"){
// bb="no";
// }else{
// bb="ok";
// }
//js.put("sign",bb);  // put을 이용해서 배열로 생성 ("배열키", 배열값)

//js.put("",bb);//key값이 없을때 해서""로 보냄 
out.print(bb);
out.print(js);

//여러개의 데이터가 있을 시..  JSONArray 필수!
// String a ="hong";
// String b = "홍길동";
// js.put("mid", a);
// js.put("mname", b);

// out.print(js);

	//!외부통신 !->data.jsp로 옮김.
String arr[][] = {
		{"hong", "홍길동"},
		{"park", "박찬호"},
		{"lee", "이순신"},
		
};
//배열형태로 집어넣기 : add

JSONArray ar = new JSONArray(); 
//jsonarray : 각각의 배열로 만들어진 데이터를 그룹화[] 하여 값을 저장하는 클래스 입니다.

for(int k=0; k<arr.length; k++){

	JSONObject js1 = new JSONObject(); //배열로 만들어줌!

js.put("mid",arr[k][0]);
js.put("mname",arr[k][1]);
ar.add(js);
}
out.print(ar);
//여기까지!





// //String json ="{\"mid\":" +a+",\"mname\":"+b+"\"}";  강제로찍기.. 사용X
// //out.print(json);


%>