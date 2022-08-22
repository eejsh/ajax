<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.security.MessageDigest" %>
<%@ page import="java.security.*" %>    
<%!
// HASH 구현을 위한 클래스 파일생성
		public class CEncrypt
		{
				MessageDigest md;
				String strSRCData = "";
				String strENCData = "";

				public CEncrypt(){}
				public CEncrypt(String EncMthd, String strData)
				{
						this.encrypt(EncMthd, strData);
				}

				public void encrypt(String EncMthd, String strData)
			 {
					 try
					{
							MessageDigest md = MessageDigest.getInstance(EncMthd);
						 byte[] bytData = strData.getBytes();
						 md.update(bytData);

						 byte[] digest = md.digest();
						 for(int i =0;i<digest.length;i++)
						 {
								 strENCData = strENCData + String.format("%02x",digest[i] & 0xFF).toLowerCase();
						 }
					 }catch(NoSuchAlgorithmException e)
					{
						 System.out.print("암호화 알고리즘이 없습니다.");
					};
					strSRCData = strData;
				}
				public String getEncryptData(){return strENCData;}
				public String getSourceData(){return strSRCData;}

				public boolean equal(String strData)
				{
					if(strData == strENCData) return true;
					return false;
				}
		}
%>
<jsp:useBean id="smsid" scope="session" class="test.ServiceSMSSoapProxy" />

<%
	if (request.getParameter("endpoint") != null && request.getParameter("endpoint").length() > 0)
		smsid.setEndpoint(request.getParameter("endpoint"));
%>

<%	String method = request.getParameter("method");
	String smsID = "";
	String hashValue = "";
	String hash_temp = "";
	String senderPhone = "";
	String receivePhone ="";
	String smsContent = "";
	String resultReturn = "";
	String reserveDate ="";
	String reserveTime = "";
	String userDefine = "";
	String callbackUrl = "";
	String searchValue = "";
	String mode = "";
	CEncrypt encrypt;
	
	int methodID = 0;
	if(methodID != -1) methodID = Integer.parseInt(method);
	boolean gotMethod = false;

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인증번호 발송 및 인증번호 확인</title>
</head>
<body>

<%
	
//	String randno = "123456"; //인증번호 -랜덤..
	Random rd = new Random();
	String sc = "";
	int w=0;
	while(w<6){
		int i = rd.nextInt(10);
		sc+= i;
		w++;
	}
	
//	out.print(sc);
	

	try{
	
	String id = "";
	String pw = "";
	String tel = "";
	gotMethod = true;
	smsID= id;
	hashValue = pw;
	senderPhone =  tel;
	
	receivePhone =  request.getParameter("receivePhone");
	smsContent =  "인증번호 :" + sc;
	
	hash_temp = (smsID + hashValue + receivePhone); //아이디, 패스워드,수신번호를 hash화시킴

	encrypt = new CEncrypt("MD5", hash_temp);
	String sendSMS = smsid.sendSMS(smsID, encrypt.getEncryptData(), senderPhone, receivePhone, smsContent);

//	out.println("결과코드 : " + sendSMS);	

	
	
}catch(Exception e){
	e.getMessage();
	
	
}

%>
발송된 인증번호 입력 : <input type="text" name="seno" id="seno"><br>
<input type="button" value="인증확인" onclick="secheck()">


</body>
</html>
<script>

function secheck() {
	//자비스크립트에서 jsp 변수값을 가져온는 부분~

	var ori = "<%=sc%>";
	// 사용자가 입력한 값과 난수번호로 만들어진 숫자가 동일하면 인증번호가 확인되었습니다. 라는 메세지를 출력
	// 단, 인증번호가 틀릴 경우 인증번호를 다시한번 확인 하세요 라는 메세지가 출력되는 프로세서를 구현하시오.
	
	var ckno = document.getElementById("seno").value;
	
	if(ori==ckno){
		alert('인증확인.');
		
	}else{
		alert('번호를 확인하시오');
	}
	
	
}
</script>

