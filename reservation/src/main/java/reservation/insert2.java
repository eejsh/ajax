package reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class insert2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public insert2() {
    }
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    req.setCharacterEncoding("utf-8");
    resp.setContentType("text/html; charset=utf-8");
    PrintWriter pw = resp.getWriter();
    
    
    try {
		dbconfig dbc = new dbconfig();       //dbconfig.java 호출
		Connection con2 = dbc.getConnection(); //dbconfig class 안에 있는 getConnection () 메소드를 가져옴
		
		pw.write(con2.toString()); //http://localhost:8080/reservation/insert2.jsp : 연결확인
		String sql = "insert into reservation (ridx, rnm, rpw, rno, remail, rtel, rperson, rindate) ";
	       sql +=" values ('0',?,?,?,?,?,?,?)";
	  PreparedStatement ps = con2.prepareStatement(sql);
	  ps.setString(1, "배고파"); 
	  ps.setString(2, "bb1234");
	  ps.setString(3, "121454");
	  ps.setString(4, "gopa@com.com");
	  ps.setString(5, "01023567485");
	  ps.setString(6, "2");
	  ps.setString(7, "2022-08-25 13:02:00");
	
	  int n = 0;
	  n= ps.executeUpdate();
	  if(n>0){
	  System.out.println("DB입력성공");
	  con2.close();  // 커넥터 닫기!
	  }else{
	  System.out.println("오류!");
	  }
	  	}catch (Exception e) {
			
		}finally {
// connect가 try 밖에 선언되어있을 때 사용.
//			if(n>0) {
//				con2.close();
//			}catch(Exception ee) {
//				
//			}
			
			
		}
    	
    	
    	
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

}
