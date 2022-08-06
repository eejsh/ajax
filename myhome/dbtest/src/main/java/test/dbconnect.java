package test;

import java.sql.*;

public class dbconnect {
	//웹에 안띄움. 실제 로드는 index2.java
	
	//mysql 커넥터 방법.
	public static Connection ct() throws ClassNotFoundException, SQLException {
	String dbdrive = "com.mysql.jdbc.Driver";
	String dburl = 

	
	// mysql 부분에 mssql로 변경해서 사용가능..
	//mssql 커넥터 방법
//	String dbdrive = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
//	String dburl = "jdbc:sqlserber://localhost:1433/webmail";
	
	
	
	String dbuser = "
	String dbpw = "
	
	Class.forName(dbdrive);
	Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
	
	return con;
	
	}
		
}
