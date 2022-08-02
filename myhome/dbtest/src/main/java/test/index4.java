package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index4 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public index4() {
    }

	public void init(ServletConfig config) throws ServletException {
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 request.setCharacterEncoding("utf-8");
	 String pidx = request.getParameter("jidx1");
	 String point = request.getParameter("data1");
	 
		
		try {
			
			dbconnect db = new dbconnect();
			Connection ct = db.ct();
			//updata 적용 시 select 후에 updata가 진행 되어야 합니다.
			//?는 1부터 시작!
			String sql = "update joinmember set jpoint=? where jidx=?";
			PreparedStatement ps = ct.prepareStatement(sql);
			ps.setString(1, point);
			ps.setString(2, pidx);		
			int n =0;
			//execute : select에만 사용
			n = ps.executeUpdate();
			if(n>0) {
				System.out.println("정상적으로 수정 완료 되었습니다.");
			}else {
				throw new Exception("error");  //에러뜨면 catch에있는 문구 뜸.
				
			}
			
		}catch(Exception e) {  //에러
			e.getMessage();
			System.out.println("데이터 컬럼값 오류!");
		}finally { //에러났을때 어떻게 할것인지?
			
			
		}

		
		
	
	}

}
