package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class test5 extends HttpServlet {
	PrintWriter pr = null;
	String key = null;
	
	private static final long serialVersionUID = 1L;
       
    public test5() {
    	this.key=null;
    			
    }

	public void init(ServletConfig config) throws ServletException {
	}
	//url에 직접적으로 접속 하였을 경우 doget이 무조건 발동하게  됩니다.
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		this.pr = response.getWriter();
		
		if(this.key==""|| this.key==null) { // 해당 key 값은 기본으로 null으로 처리함. 
			this.pr.print("<script>"
					+ "alert('올바른 접근 방식이 아닙니다.');"
					+ "history.go (-1);"
					+ "</script>");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String key = request.getParameter("key").intern();
		this.pr = response.getWriter();
		
		if(key==""|| key==null) {  //key 없이 웹에서 localhost:8080/jweb/test5.do로 들어올 시 메세지 출력
			this.pr.print("<script>"
					+ "alert('올바른 접근 방식이 아닙니다.');"
					+ "history.go (-1);"
					+ "</script>");
			
		}
		else if(key=="loginpost") { //key 값이 확인 되었을 경우 
			String mid = request.getParameter("mid");
			String mpass = request.getParameter("mpass");
		
			//Database 연결하는 부분.
			
		}
		
		
		
		
		
		
	}

}
