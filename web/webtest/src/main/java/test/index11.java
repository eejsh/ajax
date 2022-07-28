package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index11 extends HttpServlet {
	
	static String mm;
	
	private static final long serialVersionUID = 1L;
       
    public index11() {

    }

	public void init(ServletConfig config) throws ServletException {

	
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		PrintWriter pr = response.getWriter();
		String mid = request.getParameter("mid");
		String key = request.getParameter("key").intern();
		
		
		if(key!="123456") {
		this.mm = null;  //mm값 초기화
			pr.print("error" + this.mm);
		}else{
			this.mm=mid;
			
			pr.print(mid);
		}
		
	
		
		
		
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	
	}

}
