<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.StandardCopyOption"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.*"%>
<%@page import="java.io.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ex27.jsp 파일 업로드 처리파트 </title>
</head>
<body>

<%

String now = new SimpleDateFormat("yyyyMMdd").format(new Date());
out.print(now);


//저장경로
String save = "C:\\myhome2\\faq\\src\\main\\webapp\\upload";

//저장 시 POST 전송 된 파일 크기 용량
int max_save = 1024*1024*2;  //2mb

//파일명 인코딩
String lang ="utf-8";

//MultipartRequest mr = new MultipartRequest(request,"C:\\myhome2\\faq\\src\\main\\webapp\\upload\\", 1024*1024*2, "UTF-8", new DefaultFileRenamePolicy());
MultipartRequest mr = new MultipartRequest(request, save, max_save, lang, new DefaultFileRenamePolicy());
//MultipartRequest : 파일 저장 시 사용하는 라이브러리 클래스명
//new DefaultFileRenamePolicy : 새로운 객체 생성을 하기 위해 사용.


//Enumeration : 파일 객체 이므로 자료형으로 받음!
//getFileNames : 배열 정보로 가져옴
Enumeration files = mr.getFileNames();  

//문자열로 변환 nextElement : 업로드한 파일 모두를 말합니다.
String filenm = (String) files.nextElement();

//실제 파일명
String postfile = mr.getOriginalFileName(filenm);   //원본 파일 이름

//복사된 파일명
String savefile = mr.getFilesystemName(filenm);    

//파일 type 형태 
String filetype = mr.getContentType(filenm);

out.print(postfile);
out.print(savefile);
out.print(filetype); 


/*[파일명을 강제 변경 업로드 된 파일을 변경하는 방식]
jsp는 업로드 후 파일명을 변경함...*/

if(savefile!=null){
	File f = new File(save + "\\" + savefile);    //file io로 사용해야됨..
	String fnm = f.getName();
	
	
	//lastindexof : 뒤에서부터 단어를 읽어감
	//substring(문법) : 글자를 자를 대 사용하게 됩니다. 
			
	//abc.jsp -> abc jsp => . 기준으로 분할함.
	String split = fnm.substring(fnm.lastIndexOf("."));  //lastindexof :끝에서부터..
	String newfilenm = now + split;
	
	out.print(newfilenm);
	
	
	//files.io 사용해서 해당 파일명을 변경
	//StandardCopyOption.ATOMIC_MOVE : (JAVA 언어 패킷) : 기존 파일은 삭제 하고, 변경된 파일로 복사하면서 이름이 변경됨
	
	
	Path a = Paths.get(save + "\\"+ savefile);
	Path b = Paths.get(save + "\\"+ newfilenm);
	Files.move(a, b, StandardCopyOption.ATOMIC_MOVE);
	
	
	
}

%>

</body>
</html>