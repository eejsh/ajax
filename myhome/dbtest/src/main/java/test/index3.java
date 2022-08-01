package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index3 extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private PrintWriter pr =null;
    protected Connection con = null;
    protected LocalDateTime now = null;
    
    String mname, mid, mpw, memail;   // 파라미터에서 받아서 this사용!
    
      
    public index3() {
    	try {
    		dbconnect db = new dbconnect();
    		this.con = db.ct();
    	}catch(Exception e) {
    		this.pr.write("<script>console.log('DB접속 오류'); </script>");
    		e.getMessage();
    	}
    }

	public void init(ServletConfig config) throws ServletException {
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
    
		this.mname=request.getParameter("join_nm");
		this.mid=request.getParameter("join_id");
		this.mpw=request.getParameter("join_pw");
		this.memail=request.getParameter("join_email");
		this.now = LocalDateTime.now();
		
		//datetime 컬럼값으로 설정할 경우
		DateTimeFormatter df = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		String today = this.now.format(df);
		
		
//current timestamp 컬럼값으로 설정 할 경우..
//		java.util.Data date = new java.util.Date();
//		long time = date.getTime();
//		java.sql.Timestamp ts = new java.sql.Timestamp(time);
		
		System.out.println(today);
		
		int point = 1000;
		/*auto increment 컬럼값도 적용해야 합니다. */
		
		
		String sql ="insert into joinmember(jidx, jnm, jid, jpw, jemail, jpoint, jdate) values('0','"+this.mname+"','"+this.mid+"','"+this.mpw+"','"+this.memail+"','"+point+"','"+today+"')";
		/*? 로 표시 할 경우 무조건 물음표는 1부터 시작합니다.*/
		System.out.println(sql);
		
		try {   //DB와 통신할 때 예외처리 필수 사용..
			PreparedStatement pr = this.con.prepareStatement(sql);
			int oksign =0;
			oksign = pr.executeUpdate(); //insert : executeUpdate 사용 , db에 저장!
			
			// 정확하게 저장될 경우 oksign은 무조건 +1이 작동됩니다.
			// executeupdate() :  insert, update, delete 선언시에만 사용!!!!!!!
			
			response.setContentType("text/html; charset=utf-8");
			this.pr = response.getWriter();
			
			if(oksign > 0) {
				this.pr.write("회원가입이 정상적으로 진행 되었습니다.");
			}else {
				this.pr.write("DB 컬럼에 문제가 발생 하였습니다.");
			}
		}catch(Exception e) {
			e.getMessage();
		}

		
		
	}

}
