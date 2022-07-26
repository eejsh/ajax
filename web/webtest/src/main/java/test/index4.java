package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index4 extends HttpServlet {
	PrintWriter pr = null;
	
	private static final long serialVersionUID = 1L;
       

    public index4() {

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		//System.out.println(request.getMethod());
		//request.getMethod() : html에서 POST, GET, PUT 확인이 가능함.
		
		//  this.pr.print : ajax post, get 으로 넘을 때 응답만 받아야 할 경우.  (ajax는 호출 -> 페이지 변환 안됨, 값 받아서 처리해야됨.... 회원가입 같은경우, 인증번호 받을경우.. 사용) 
		
		String m = request.getParameter("userid").intern();
		this.pr = response.getWriter();
		if(m=="") {
	     this.pr.print("error");
		}else if(m=="hong"){   // 아이디가 중복 되었을 때 ajax return
		    this.pr.print("no");	
		}else {		// 아이디가 중복되지 않았을 때 ajax return;
			
		    this.pr.print("ok");
		}
		
		
		
		//System.out.println(m);
	
	
	
	}

}
