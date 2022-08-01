package test;

import java.sql.*;

public class dbconnect {
	//웹에 안띄움. 실제 로드는 index2.java
	public static Connection ct() throws ClassNotFoundException, SQLException {
	String dbdrive = "com.mysql.jdbc.Driver";
	String dburl = "jdbc:mysql://localhost:3306/webmail";
	String dbuser = "hong";
	String dbpw = "a1234";
	
	Class.forName(dbdrive);
	Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
	
	return con;
	
	}
		
}
