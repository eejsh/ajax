package configure;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginck extends HttpServlet {  // 컨트롤.. 
	private static final long serialVersionUID = 1L;
    public loginck() {
    
    }

	public void init(ServletConfig config) throws ServletException {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String mid = request.getParameter("userid");
		System.out.println(mid);
		
		try {
			login_module lm = new login_module();
			
			String data[]= { mid };
			
			lm.main(data);  //배열
			
		
			
			PrintWriter pw = response.getWriter();
			
			String r = lm.result_check();  //getter 형태로 로드
			System.out.println(r);
		
			if(r==null) {
				throw new Exception("error");
			}else {
				pw.print(r);
			}
			
		}catch(Exception e) {
		PrintWriter pw = response.getWriter();
		pw.print("데이터베이스 오류..");
		}
		
	}

}
