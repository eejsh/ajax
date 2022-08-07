package config;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class faq_main extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public faq_main() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	
	String cate = request.getParameter("se");
	String name1 = request.getParameter("name1");
	String abox = request.getParameter("abox");
	String qbox = request.getParameter("qbox");
	
	System.out.println(cate+name1+abox+qbox);
			
	
	
	
	}

}
