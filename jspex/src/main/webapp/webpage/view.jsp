<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p>상품출력</p>

<!-- <table> -->
<!-- <tr> -->
<%-- <td><%=p %></td> --%>
<!-- </tr> -->
<!-- </table> -->

<div style="width: 400px; height: 300px;">
<textarea name="notice_text" id="notice_text"><%=m %><img src ="<%=i %>"></textarea>

<input type="text" name="notice_text2">


</div>
<!-- 
<%-- 게시판 안에 데이터 출력 가능 <%= m %>추가! --%>
eidtor - textaera에서 사용하는게좋음.
input type="text"도 출력 가능. 단, 칸이 짤릴 수 있음.


Editor - 게시판 // 글자굵게, 기울기, 색상) api
1.CKeditor - javascript로 구현가능
2.daumEditor  .. 단 jquery 필수
3.DEXT5 Editor 

4.네이버 스마트 에디터 
5.Namo Cross Editor

 -->