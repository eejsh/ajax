package reservation;

import java.sql.*;

public class dbconfig {

	// public static void dbconnect() {

	Connection con = null;
	public Connection getConnection() throws ClassNotFoundException, SQLException {


		String db = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://kbsn.or.kr:3306/cclass";
		String user = "java_c";
		String pw = "java_cclass";

		Class.forName(db);
		con = DriverManager.getConnection(url, user, pw);

		System.out.println("db접속성공");
		
		return con;
		
	}

}
