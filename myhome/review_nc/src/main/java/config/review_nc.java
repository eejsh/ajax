package config;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class review_nc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public review_nc() {
    }
	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");	
	    response.setContentType("text/html; charset=utf-8");
	
	    String user = request.getParameter("username"); //고객명
	    String pname = request.getParameter("proname"); //상품
	    
	    //int ro = Integer.parseInt(request.getParameter("ro"));
	    String ro = request.getParameter("ro");
	    String usertext = request.getParameter("textbox"); 
	    
	//    System.out.println(user + pname + ro + usertext);
	    
	    reviewok_module rm = new reviewok_module();
	    
	    ArrayList<String> list = new ArrayList<String>();
	    list.add(user);
	    list.add(pname);
	    list.add(ro);
	    list.add(usertext);
	    
	    rm.insert(list);  //reviewok_module로 보냄.
	    
	    
	    
	    
	    
	    
	    PrintWriter pr = response.getWriter();
	    
	    
	    String ookk = rm.reok().intern();
	   
	   // System.out.println(rm);
	   // System.out.println(ookk);
	    
	    if(ookk=="ok") {
	    	pr.print("<script>alert('내용이 저장되었슴...'); location.href='./review_write.html' </script>");
	    	
	    }else {
	    	pr.print("<script>alert('데이터가 올바르지 않습니다..ㅜ'); location.href='./review_write.html' </script>");
	    	
	    }
	  
	    
	    
	    
	    
	}

}
