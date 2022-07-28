package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class test1 extends HttpServlet {

	private static final long serialVersionUID = 1L;
       
    public test1() {
    }

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	PrintWriter pr =  response.getWriter();
	
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");

	//JSONObject jo = new JSONObject();  //html에서 json으로 2개의 데이터를 받음으로 jsonobject 설정.
	//response.setContentType("application/x-json; charset=utf-8");
	// key값으로 날아옴 {sdate : sdate, edate : edade..}.. 
	
	String s = request.getParameter("sdate");
	String e = request.getParameter("edata");
	/*
	pr.print(s);
	pr.print(e);
	*/
	
	pr.print("ok");
	
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
