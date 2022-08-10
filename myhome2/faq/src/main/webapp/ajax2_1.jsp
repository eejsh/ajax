<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String key = request.getParameter("apikey").intern();
if(key=="abc123"){
String [][] weather ={
		{"a1", "125"},
		{"a2", "108"},
		{"a3", "380"},
		{"a4", "182"},
		{"a5", "115"},
		{"a6", "102"},
	};

//DB or 배열을 파싱하는 작업 
JSONArray ja = new JSONArray();
int w =0;
while(w<weather.length){
JSONObject jo = new JSONObject();
jo.put("area", weather[w][0]);
jo.put("areanum", weather[w][1]);
ja.add(jo);
w++;
}
out.print(ja);  //최종 배열값을 보내는 형태

}
else{
	JSONObject jo2 = new JSONObject();
	jo2.put("data","error");
	out.print(jo2);
}
%>
