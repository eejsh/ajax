<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //CORS : 도메인 및 아이피가 다를 경우 외부에서 .json을 가져가지 못함.. 
    response.addHeader("Access-Control-Allow-Origin","*");
    response.addHeader("Access-Control-Allow-Credentials","true");
    //response.addHeader : .bashrc(서버) 입력하게 되어있음.
    //JSP에 코드를 입력해서 Access-control-allow 을 이용해서 허락을 적용함.  "*"= 모든것을 받아줌, true 허락
    
    
    
//a서버에서 자신의 서버로 접속 시 허락된 파라미터 명 + 라파미터 값을 확인함..  
    String aa = request.getParameter("apikey").intern();
    if(aa=="aaaa"){
    String arr[][] = {
      {"hong", "홍땡동"},
      {"park", "박땡호"},
      {"lee", "이땡신"},
};
JSONArray ar = new JSONArray(); 
for(int k=0; k<arr.length; k++){
JSONObject js1 = new JSONObject(); //배열로 만들어줌!
js1.put("mid",arr[k][0]);
js1.put("mname",arr[k][1]);
ar.add(js1);
}
out.print(ar);    // 허락 후 배열값을 전송함!!
    }
     %>
     
     <!-- jsp는 스트림 없음, include 사용해서 로드함 -->
