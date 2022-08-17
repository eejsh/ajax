<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ tag import="java.sql.*" %>

<%
Connection con = null;
String userid = null;

try {
	String Driver = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://umj7-009.cafe24.com/eejsh08";
	String user = "eejsh08";
	String password = "hoho12!@";

	Class.forName(Driver);
	con = DriverManager.getConnection(url, user, password);

		String sql = "select * from poll order by idx desc ";
	
		try {

		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			out.print(rs.getString("id")+"<br>");
		
	//	userid=rs.getString("id");
		}
//request.setAttribute("userid",userid);
		
	} catch (Exception e) {
		e.getMessage();

	}

} catch (Exception ee) {
	ee.getMessage();
}
%>
