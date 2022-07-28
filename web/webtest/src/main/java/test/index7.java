package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;
/*[java] 응용

해당 아이디와 패스워드 데이터를 전달 받습니다.

아이디는 kim
패스워드는 a123456

'로그인 하셨습니다.' 라고 alert이 작동되어야 합니다.
단, 아이디, 패스워드가 틀릴 경우 회원정보를 다시한번 확인하세요 라는 alert이 작동되고
다시 해당 사이트로 전달되어야 합니다.

history.go


 * 
 * */
public class index7 extends HttpServlet {
	PrintWriter pr = null;
	private static final long serialVersionUID = 1L;
     
    public index7() {
    
    }

    public void init(ServletConfig config) throws ServletException {
	
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");

	pr = response.getWriter();
	
	String us = request.getParameter("user").intern();  //파라미터
	String pw = request.getParameter("pw").intern();  //파라미러
	
	
	String iid = "kim";
	String ppw = "a123456";
	
	
	if(us==iid && pw==ppw) {
		pr.print("<script>alert('로그인 하셨습니다.')</script>");
   	}
	else if(us==iid || pw==ppw) {
		pr.print("<script>alert('아이디 또는 패스워드를 확인해 주세요.'); history.go(-1)</script>");
	}
	else {
   		pr.print("<script>alert('회원정보를 다시한번 확인해 주세요.'); history.go(-1)</script>");
   	}
	
System.out.println(us);
System.out.println(pw);
	


//풀이  // backend 코드는 뒤로가기 할 시 중간단계 없이 html파일로 넘어감..

//request.setCharacterEncoding("utf-8");
//response.setContentType("text.html; charset=utf-8");

//String mid = request.getParameter("mid2").intern();
//String mpw = request.getParameter("mpm2").intern();
//this.pr = response.getWriter();
//
//if(mid=="kim") {
//	if(mpw=="a123456") {
//		this.pr.print("<script>alert('로그인 하셨습니다..'); location.href='./index6.html'; </script>");
//	}else {
//		this.pr.print("<script>alert('아이디와 패스워드를 다시 확인하세요.');history.go(-1) </script>");
//	}
//	
//}else {
//	this.pr.print("<script>alert('아이디와 패스워드를 다시 확인하세요.');history.go(-1) </script>");
//}
//

	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
