package reservation;

import java.sql.*;

public class dbconfig {

	// public static void dbconnect() {

	Connection con = null;
	public Connection getConnection() throws ClassNotFoundException, SQLException {


		String db = ";
		String url = "";
		String user = "";
		String pw = "";

		Class.forName(db);
		con = DriverManager.getConnection(url, user, pw);

		System.out.println("db접속성공");
		
		return con;
		
	}

}
