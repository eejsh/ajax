package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dbconfig {
//SQL 환경설정, 모듈
	protected Connection con() throws ClassNotFoundException, SQLException{
		
		String dburl ="jdbc:mysql://localhost:3306/eejsh08";
		String dbdrive = "com.mysql.jdbc.Driver";
	    String dbuser = "eejsh08";
	    String dbpw ="hoho12!@";
		
		Class.forName(dbdrive);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
		
		
		return con;
		
	}
	
	
	
	
}
