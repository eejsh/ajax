package pro;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class faq_updateok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public faq_updateok() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter pw = response.getWriter();
		
		try {
		
			dbcon db = new dbcon();
			Connection con = db.cafe24();
			
			String inx = request.getParameter("inx");
			String fcate = request.getParameter("fcate");
			String faq_qc = request.getParameter("faq_qc");
			String faq_aw = request.getParameter("faq_aw");
			String faq_view = (String)request.getParameter("faq_view").intern();
			
			String faq_view2 = "N"; 
			
			if(faq_view=="Y") {
				faq_view2 = "Y";
			}else {
				faq_view2 ="N";
			}
			
			
			System.out.println(faq_view2 + "ㅇㅇ?");
			
			
			
			
			String sql = "update faq_board set faq_view='"+faq_view2+"', fcate='"+fcate+"',faq_qc='"+faq_qc+"',faq_aw='"+faq_aw+"' where inx='"+inx+"'";
			
			
			PreparedStatement ps = con.prepareStatement(sql);
			
			System.out.println(ps);
			
			int n =0;
			
			n=ps.executeUpdate();
			
			if(n > 0) {
				pw.print("<script>"
						+ "alert('FAQ 수정이 완료 되었습니다.');"
						+ "location.href='./faq_list.html';"
						+ "</script>");
				
			}else {
				throw new Exception("error");
			}
			con.close();
			
		}catch(Exception e) {
			
			pw.print("<script>"
					+ "alert('올바른 접근이 아닙니다. [update]');"
					+ "history.go(-1);"
					+ "</script>");
			
		}
		
	
	}

}

