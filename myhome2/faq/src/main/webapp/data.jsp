<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    //CORS : 도메인 및 아이피가 다를 경우 외부에서 .json을 가져가지 못함.. 
    response.addHeader("Access-Control-Allow-Origin","*");
    response.addHeader("Access-Control-Allow-Credentials","true");

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
out.print(ar);
    }
     %>