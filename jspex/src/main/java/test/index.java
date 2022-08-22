package test;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public index() {
    }
    @Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html; charset=utf-8");
    	
    	String msg = "홍길동님환영합니다.";
    	String product = "로봇청소기";
    	
    	String imgs = "./img/thum_new01.png";
    
    	
 request.setAttribute("msg", msg);
 request.setAttribute("product", product);
 request.setAttribute("imgs", imgs);
 
 
 
	RequestDispatcher rd = request.getRequestDispatcher("main.jsp");
	rd.forward(request, response);
	
	
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	
	}

}
