package pro;

import java.sql.*;

public class dbcon { //db커넥터

//	private static String dburl = null;
//	private static String dbuser = null;
//	private static String dbpw = null;
	
	//데이터베이스별로 나눠서 사용 가능.
	
	//cafe24  
	public static Connection cafe24() throws ClassNotFoundException , SQLException{
	
//		dburl = "jdbc:mysql://umj7-009.cafe24.com/leejongh";
//		dbuser = "leejongh";
//		dbpw = "Tt04860486!";
		
		
		String dbDriver = "com.mysql.jdbc.Driver";
		String dburl ="jdbc:mysql://umj7-009.cafe24.com/eejsh08";
	    String dbuser = "eejsh08";
	    String dbpw ="hoho12!@";
		
		Class.forName(dbDriver);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
		return con;
	}
	
	//kbsn
	public static Connection kbsn() throws ClassNotFoundException , SQLException{
		
		String dbDrive = "com.mysql.jdbc.Driver";
		String dburl ="jdbc:mysql://kbsn.or.kr:3306/classc"; 
	    String dbuser = "mekeyace";
	    String dbpw ="t04860486";
		
		Class.forName(dbDrive);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
	
		return con;
	}
	
	
}
