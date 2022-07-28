package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

public class test2 extends HttpServlet {
	PrintWriter pr = null;
	
	private static final long serialVersionUID = 1L;
    public test2() {
    }

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 request.setCharacterEncoding("UTF-8");
	// response.setContentType("text/html; charset=UTF-8");  //문자형태로 받음
	 
	 String user = request.getParameter("user_name").intern();
	 this.pr = response.getWriter();
	 
	 //응용 : hong, hong@nate.com
	 if(user=="홍길동") {  //해당 사용자의 정보를 배열값으로 전송함
		 List<String> list = new ArrayList<String>();  //list 빈 배열 생성
		 
		 list.add("hong"); // 배열값 저장1
		 list.add("hong@nate.com"); //배열값 저장2
		 // this.pr.print(list);  // 배열 아님, 문자형태로 보냄.

		 JSONObject jdata = new JSONObject();  //실제 배열형태의 구조로 {}를 생성하기 위해서 사용. (java는 []밖에 없음!) object 사용..
		 jdata.put("list", list);   //jdata.put("배열이름", list 값 );  put: 기존값에서 추가로 사용할 때 ..
		 
		 response.setContentType("application/x-json; charset=utf-8"); //json 배열 형태로 값 전송  
		 response.getWriter().print(jdata);     //배열값으로 찍음. 
		 
		 //call로 보낼 경우 무조건 한번만 사용함.(print 1회만!!)
		 		 
	 }else {
		
		this.pr.print("error");
		 
	 }
	 
	 
	 
	
	}

}
