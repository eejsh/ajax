package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class test3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public test3() {
    
    }
	public void init(ServletConfig config) throws ServletException {
	
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    request.setCharacterEncoding("UTF-8");
	ArrayList<String> ck = new ArrayList<String>();
	
	/* name명이 모두 다르게 적용을 해야 할 경우
    int w=1;
	while(w<=5) {
	ck.add(request.getParameter("like"+w));
	w++;	
	}
    System.out.println(ck);
    */
    
    // name명이 모두 같을 경우 
	//get.parameterBalues : name 값이 같은 경우 + 값이 다른 상황이며 해당값만 추출하여 배열로 생성함. , 라디오도 똑같은 형태..
	
	
	String like[] = request.getParameterValues("like");  //name이 같을 경우 values써야댐, values는 웹에서만 사용됨
	
	//System.out.println(like.length);
	
	int w = 0;      // node 배열 0부터 시작
	while(w<like.length) {
		System.out.println(like[w]);
		w++;
	}
	
	
	
	
	
	
	
	}

}
