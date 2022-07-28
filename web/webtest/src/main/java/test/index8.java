package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index8 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public index8() {
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}
	
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* 숙제
		   index8.html에서 id값을 전송 받아서
		   아이디 park 외에는 모두 "가입되지 않은 고객 입니다." 라는 메세지  출력 및 전 페이지로 이동을 합니다.
		   park으로 데이터가 전송 받을 경우   "로그인 되셨습니다." 라는 메세지와 함께 nate.com으로 이동 합니다.
		  */
		
		PrintWriter pr =  response.getWriter();

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
	    String mid = request.getParameter("mid").intern();
	    
     if(mid=="park") {
    	 pr.print("<script>alert('로그인 되었습니다.');   location.href = 'http://www.nate.com'; </script>");
    	      }else {
    	 pr.print("<script>alert('가입되지 않은 고객 입니다.'); history.go(-1)</script>");
  	     }

  }
}
