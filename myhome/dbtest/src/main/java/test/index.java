package test;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public index() {
    }

	public void init(ServletConfig config) throws ServletException {
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
	//connection getConnection : SQL에 연결되는 메소드 이름 입니다.  무조건 return ! , 자료형 메소드임. (= public string ..)
	public Connection abc() throws ClassNotFoundException, SQLException{
		//	public Connection  getConnection() throws SQLException, ClassNotFoundException{
		
		//DB 접속 정보
		String dbconnect = "com.mysql.jdbc.Driver";
		/*  om.mysql.jdbc.Driver(5.X 버전 때) or com.mysql.jdbc.cj.Driver (8.x버전때.. ,오라클도 같이 연결 될 시 cj가 걸려있을 수 있음.) */
		String dburl = "jdbc:mysql://localhost:3306/webmail"; 
	            //"localhost(서버주소):3306(mysql)/데이터베이스 이름", cafe24에 dburl 들어감
		String dbuser = "hong"; // 사용자 DB 접속 아이디
		String dbpw ="a1234";  //사용자 DB 접속 패스워드
		
		Class.forName(dbconnect);   // 해당 정보를 class 로드함.
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);  //실제 연결
		// DriverManager.getConnection(연결주소,사용자id,사용자비번); 
		
		return con;  //return 필수!!!
				
	}
 	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 try {
	//	 Connection con = getConnection();
		Connection con = abc();
		 System.out.println("연결성공!");
		 
		 String sql ="select * from shopmember";
		// con.createStatement(); 사용안함 - 속도 느림.
		 PreparedStatement ps = con.prepareStatement(sql);   // sql 입력.
		 //  Prepared를 사용하는 이유는 데이터베이스 효율성을 높이기 위해서 사용하는 문법입니다.
		 
		 ResultSet rs = ps.executeQuery();
		 //executeQuery : select 문에서 사용합니다. (ResultSet)
		 
		 int a =0;
		 while(rs.next()) {  //rs.next : DB 전체 리스트값  
			String user = rs.getString("suser");   // getString : (DB)shopmember안의 컬럼 명
		//	String pass = rs.getString("spasswd");
			
		//	String user = rs.getString(0);  //컬럼 번호 
			System.out.println(user);
			 
		 }
		 
	 
		 
	 }catch(Exception e) {
	//	 e.getMessage();
	 System.out.println("연결실패ㅠ");
	 }
		
		
	}

}
