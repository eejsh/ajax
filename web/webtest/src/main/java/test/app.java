package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class app extends HttpServlet {
	static int numbers;
	
	private static final long serialVersionUID = 1L;
    
	
    public app() {
    
    
    }

	public void init(ServletConfig config) throws ServletException {
	
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");	
		
	PrintWriter pr = response.getWriter();
//	String userno = request.getParameter("ub");
	int usernn =Integer.parseInt(request.getParameter("ub"));
	
	//int unn = Integer.parseInt(userno);
	
//	pr.print(userno);
	
	Random ro = new Random();
	int com = ro.nextInt(10+1);
	
	if(com==usernn) {
		
			pr.print("당첨! user:"+usernn+ " com:" + com);
	}else {

		pr.print("다음기회에..! user:"+usernn+ " com:" + com);
	}
	
	System.out.println(com);
	System.out.println(usernn);
	
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

}
