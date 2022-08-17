<%@ tag language="java" pageEncoding="UTF-8" body-content="empty"%>
<%@ tag import="java.sql.*" %>

<%
Connection con = null;
String userid = null;

try {
	String Driver = "";
	String url = "";
	String user = "";
	String password = "";

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
