package test;

import java.io.IOException;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import javax.mail.Message;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class security extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public security() {
    }

	public void init(ServletConfig config) throws ServletException {
	
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*base64 : decoder, encoder 두가지가 존재합니다.
		 * 기초 암호화 부분이며, 역으로 암호를 풀 수도 있습니다.
		 *  */
		
//		String pw = "a12345";
//		byte[] a = pw.getBytes();
//		Encoder ec = Base64.getEncoder();
//		byte[] ectext = ec.encode(a);
//		
//		System.out.println(new String(ectext));
//		
//		String pw2 = "YTEyMzQ1";
//		Decoder de = Base64.getDecoder();
//		byte[] dctext = de.decode(ectext);
//		
//		System.out.println(new String(dctext));
//		
//		try {
//			
//			//MD5 형태 암호화, 서블릿에서는 잘 사용안함. jsp에서 사용.. mvc 사용시 view에서 넘어갈때 암호화 함 
//			//MessegeDigest : Hash 알고리즘(암호화)
//			//MD5는 해석 불가  > 패스워드를 새로 바꾸게됨.. , 실무에선 md5 사용, 간단한건 base64 사용할 수 있음..
//			
//			
//			String p = "a1234";
//			MessageDigest md5 = MessageDigest.getInstance("MD5");
//			md5.update(p.getBytes("UTF-8")); //update > byte 형태로 변환
//			byte[] md = md5.digest();   // 배열 기준으로 대입하게 됨..
//			System.out.println(new String(md));
//			
//			StringBuilder sb = new StringBuilder();
//			for(byte ck : md) {
//				String recode = String.format("%2x", ck);
//				//%2x : 16진수 변환
//				sb.append(recode);
//			}
//			
//			
//			
//			
//		}catch(Exception e) {
//			
//		}

		
		
		//응용 , security.html 에서 옴
		
		request.setCharacterEncoding("utf-8");
		String pw = request.getParameter("pw");
		Decoder dc = Base64.getDecoder();
		byte[] userpw = dc.decode(pw);
		System.out.println(new String(userpw));  //hong1234로 옴! 프론트에게 암호화해서 보내주세요 btoa(비밀번호);		
		
		
		
		
		
		
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
