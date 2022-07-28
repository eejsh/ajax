package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class test4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public test4() {
    }

	public void init(ServletConfig config) throws ServletException {
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	/*  사용자가 5가지 결제 파트가 있습니다.
		해당 결제 파트 한가지를 선택 후 결제하기 버튼 클릭시 test4.java로 이동하여 (form)
		system.out.printnl 으로 고객이 선택한 결제 형태를 출력하시오.
	 */
		request.setCharacterEncoding("UTF-8");
	

		//풀이
		int no =  Integer.parseInt(request.getParameter("pay")); 
		//getParameter는 기본적으로 string임. integer.parseint로 교체!
		PrintWriter pr = response.getWriter();
			switch(no) {
		case 0:
			//response.sendRedirect : 강제 페이지 이동 , 선택된 값 저장후 다른페이지로 이동시킴. 
			response.sendRedirect("http://www.naver.com"); 
			
			break;
		case 1:
			break;
		case 2:
			break;
		case 3:   //도서상품권
			pr.print( "<script>"
					+ "alert('현재 결제방식은 시스템 점검 중입니다.');"
					+ "history.go(-1);"
					+ "</script>" );				
			break;
		case 4:
			break;
		}
		
//		response.setContentType("text/html; charset=utf-8");
//		PrintWriter pr = response.getWriter();
//		String pt = request.getParameter("pay").intern();
//		System.out.println(pt);
//	   if(pt=="도서상품권") {
//		 pr.print("<script>alert('해당결제사항은 시스템 점검에 있습니다.'); history.go(-1) </script>");
//	   }
	
	
	}

}
