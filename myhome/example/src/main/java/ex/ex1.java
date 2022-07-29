package ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ex1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ex1() {
    
    
    }

	public void init(ServletConfig config) throws ServletException {
	}
	
	
	//파라미터 전송 & 사용자가 URL을 직접 입력했을 때
	//request는 html에서 넘어온 값을 받음 
	
	//location은 값을 돌려줄수 없음.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//request : front data
	//response : backend 가 출력하는 데이터. 
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pr = response.getWriter();
		String a = request.getParameter("cal");  //html에서 cal로 보낸 값 받기
		String b = request.getParameter("cal2");
		String job = request.getParameter("job");
		System.out.println(a);
		System.out.println(b);
		pr.print("<html lang='ko'>"
				+ "<meta charset='utf-8'>"
				+ "<head>"
				+ "<body>"
				+ "</head>"
				+ "<p>결과 값 출력 : "+a+"</p>"
					+ "<p>결과 값 출력 : "+b+"</p>"
								+ "<p>선택하신 직업군은 : "+job+ " 입니다. </p>"
		
				+ "</body>"
				+ "</html>");
	
		
		
	}
	//form & AJAX(POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
		
	}

}
