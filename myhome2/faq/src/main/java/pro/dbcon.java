package pro;

import java.sql.*;

public class dbcon { //db커넥터

//	private static String dburl = null;
//	private static String dbuser = null;
//	private static String dbpw = null;
	
	//데이터베이스별로 나눠서 사용 가능.
	
	//cafe24  
	public static Connection cafe24() throws ClassNotFoundException , SQLException{
	
//		dburl = 
//		dbuser = 
//		dbpw = 
		
		
		String dbDriver = "com.mysql.jdbc.Driver";
		String dburl =
	    String dbuser = "
	    String dbpw ="
		
		Class.forName(dbDriver);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
		return con;
	}
	
	//kbsn
	public static Connection kbsn() throws ClassNotFoundException , SQLException{
		
		String dbDrive = 
		String dburl =
	    String dbuser = 
	    String dbpw ="
		
		Class.forName(dbDrive);
		Connection con = DriverManager.getConnection(dburl, dbuser, dbpw);
	
		return con;
	}
	
	
}
