package ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class ex6 extends HttpServlet {

	public int number=0; 
	
	private static final long serialVersionUID = 1L;
    public ex6() {
    }

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//프론트에서 바꿀지? 백에서 바꿀지?는 정해야됨. 

		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String data[] = { "초등학교 1학년 1년 앞당겨진다." , "한국 우주탐사선 '다누리' 내달 5일..." , "우영우'열풍'세계로 번졌다.." , "열대야, 폭염 계속... 제5호 태풍 송다 발달","메롱"};
		
		PrintWriter pr = response.getWriter();

		if(this.number==data.length) {
			this.number=0;
		}
		
		pr.print(data[number]);  
		System.out.println(data[number]);		
		this.number++;
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
