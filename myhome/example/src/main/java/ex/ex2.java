package ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//web.xml 은 절대 추가하면 안됨. 
//test 시에만 단독으로 사용함. 
@WebServlet("/ex2.do")  //@webservlet 사용시 xml 사용안함.
 

public class ex2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public ex2() {
    
    
    }

	public void init(ServletConfig config) throws ServletException {
	
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter pr = response.getWriter();
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String mid = request.getParameter("mid");
		String mpass = request.getParameter("mpass");
		String msex = request.getParameter("msex");
		
		String sms = request.getParameter("sms");
		//intern에서 null을 못받음. 
		// 일반 인풋(사용자가 입력하는값) 은 intern 사용가능하나, 마우스로 선택하는것은 intern 사용안함.
		//intern은 checkbox, radio 는 사용하지않음.
		
		
		//database enum("Y","N") ->null값이 없음 null로 오면 N으로 바꿔줌	
		if(sms==null) {
			sms="N";
		}
		

		pr.print(mid+"<br>");
		pr.print(mpass+"<br>");
		pr.print(msex+"<br>");
		pr.print(sms+"<br>");
		
		
		
		
		
	
		
		
	}

}
