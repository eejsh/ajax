package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/sc")
public class sc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public sc() {
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
	PrintWriter pw = response.getWriter();
	
	
	StringBuffer make = new StringBuffer();
	Random rd = new Random();
	
	int w =0;
	while(w<10) {
		int a = rd.nextInt(3);
		pw.print(a);
		switch (a) {
		case 0:
			make.append((char)(rd.nextInt(26)+97));  // 소문자 a~z (ascii)
			break;
		case 1:
			make.append((char)(rd.nextInt(26)+65));  // 대문자 A_Z
			break;
			
		case 2:
			make.append((rd.nextInt(10)));  // 숫자
			break;
		}
		w++;
	}
	
	String key = make.toString();
	System.out.println(key);

	
	
	//String text = "test";
	//pw.print(text);//확인 .. http://localhost:8080/jspex/sc
	
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
