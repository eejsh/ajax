package configure;

import java.sql.*;

public class dbconfig {  //SQL 환경설정 , 모듈
	
	protected Connection dbcon() throws ClassNotFoundException, SQLException { //자료형 이므로 return 필수!
		
	//local 에서 사용, mysql 사용. 
//		String dbdrive = "com.mysql.jdbc.Driver";
//		String dburl ="jdbc:mysql://localhost:3306/webmail";
//	    String dbuser = "hong";
//	    String dbpw ="a1234";
	    

		//String dburl ="jdbc:mysql://umj7-009.cafe24.com/WebMysql";
		//개발 중일때 데이터베이스가 웹(ex cafe24에 있을경우) 에 있을경우 
		//접속 URL ex) (umj7-009.cafe24.com/WebMysql) 로 연동해서 작업해야됨..
		//(cafe24) 접속정보ip 가 등록 되어있어야만 url 사용됨.. 
		

		
	
		//실제로 올릴땐 localhost:3306 으로 잡아서 백업
		String dburl ="jdbc:mysql://localhost:3306/eejsh08";
		String dbdrive = "com.mysql.jdbc.Driver";
	    String dbuser = "eejsh08";
	    String dbpw ="hoho12!@";
	    
		
		Class.forName(dbdrive);    //jdbc class 명 . 라이브러리 안에  com.mysql.jdbc,Driver가 포함되어있음. 
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
		
		return con;
		
	}
	
}
