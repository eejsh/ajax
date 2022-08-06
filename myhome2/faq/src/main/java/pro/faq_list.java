package pro;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class faq_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public faq_list() {
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			select_sql ss=  new select_sql(); //뷰데이터 호출
			ArrayList<select_sql> faqdata = ss.viewdata();
			request.setAttribute("list", faqdata);
			
			System.out.println(faqdata.toString());
			
			RequestDispatcher rd = request.getRequestDispatcher("./faq_list.jsp");
			rd.forward(request, response);
			
			
		
			
		}catch(Exception e) {
			
		}
		
		
	
	}
}
