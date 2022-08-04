package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconfig {
//SQL 환경설정, 모듈
	protected Connection con() throws ClassNotFoundException, SQLException{
		
		String dburl ="jdbc:mysql://localhost:3306/eejsh08";
	  
	//	String dburl ="jdbc:mysql://umj7-009.cafe24.com/WebMysql"; //컴
		
		String dbdrive = "com.mysql.jdbc.Driver";
	    String dbuser = "아이디";
	    String dbpw ="비번";
		
		Class.forName(dbdrive);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
		
		
		return con;
		
	}
	
}
