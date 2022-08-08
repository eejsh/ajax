package pro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class faq_writeok extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public faq_writeok() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	request.setCharacterEncoding("utf-8");
	response.setContentType("text/html; charset=utf-8");
		
	 String fcate = request.getParameter("fcate");
	 String fwrite = request.getParameter("fwrite"); //관리자
	 String faq_qc = request.getParameter("faq_qc");
	 String faq_aw = request.getParameter("faq_aw");
	 String faq_view = request.getParameter("faq_view"); //히든
	 
	 System.out.println(faq_view);
	 
	 timer tr = new timer();
	
	 String faq_indate = tr.now_datetime();
	
	 
	 
	 
	 insert_sql is = new insert_sql(fcate, fwrite, faq_qc, faq_aw,  faq_view,  faq_indate);
	 //insert_sql 클래스 안에 
	 
	 System.out.println(fcate+ fwrite+ faq_qc+ faq_aw+  faq_view+  faq_indate);
	 
	 PrintWriter pr = response.getWriter();
	 
	 try {
		 String sign = is.insql().intern();
		
		  if(sign=="ok") {
	            pr.write("<script>"
	                  + "alert('새로운 FAQ가 등록 되었습니다.');"
	                  + "location.href='./faq_list.html';"
	                  + "</script>");
	         }else {
	            throw new Exception("error");
	         }
	         
	      } catch (Exception e) {
	         pr.write("<script>"
	               + "alert('DB 저장에 문제가 생겼습니다.');"
	               + "history.go(-1);"
	               + "</script>");
	      }
	 
	 
	//배열로 넘겨서 ?로 표시해도됨
	 
	// 연습이 되면 배열로!
	 
	 
	 //수동으로 넘기기
	 
		
	
	
	}

}
