package ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ex3.do")
public class ex3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ex3() {
    
    
    }

	public void init(ServletConfig config) throws ServletException {
	
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//getRequestDispatcher : servlet에서 해당 파일을 로드할 때 사용 . + forward : 요청, 답변을 그대로사용
		//html 실행되도 똑같이 요청, 답변 그대로 쓰겠음  doget(HttpServletRequest request, HttpServletResponse response), forward(request, response)) 연동
		
		request.getRequestDispatcher("./ex3.html").forward(request, response);
		request.setCharacterEncoding("utf-8");

		response.setContentType("text/html; charset='utf-8'");
		
		String mid = request.getParameter("mid").intern();
		String mpass= request.getParameter("mpass").intern();
		
		
		System.out.println(mid);
		System.out.println(mpass);
		
		//	PrintWriter pr = response.getWriter();  dispatcher로 html로드해서 사용안됨!
		//  pr.print("mid");
		//  pr.print("mpass");
//		
//		if(mid=="hong" && mpass=="a1234") {
//			response.sendRedirect("loginok.html");
//		}else {
//			response.getWriter().print("<script>"
//					+ "alert('아이디, 패스워드를 확인하세요');"
//					+ "location.href='./ex3.do';"
//					+ "</script>");
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	
	}

}
