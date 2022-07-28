package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index5 extends HttpServlet {

	PrintWriter pr = null;  //무조건 설정 html,js 연결
	
	private static final long serialVersionUID = 1L;
    public index5() {
    }

	public void init(ServletConfig config) throws ServletException {
		
	}
//ajax는 돌려보내야됨. ->contenttype 필수 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String n =request.getParameter("user");  //파라미터값? → user
		pr = response.getWriter();
		pr.print(n);
	//	pr.print("ok");
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
