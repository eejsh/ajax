package configure;

import java.sql.*;

public class dbconfig {  //SQL 환경설정 , 모듈
	
	protected Connection dbcon() throws ClassNotFoundException, SQLException { //자료형 이므로 return 필수!
		
	 
		String dbdrive = "com.mysql.jdbc.Driver";
		String dburl ="jdbc:mysql://localhost:3306/webmail";
	    String dbuser = "hong";
	    String dbpw ="a1234";
	    
		Class.forName(dbdrive);    //jdbc class 명 . 라이브러리 안에  com.mysql.jdbc,Driver가 포함되어있음. 
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
		
		return con;
		
	}
	
}
