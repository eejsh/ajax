package pro;

import java.sql.Connection;
import java.sql.*;



//import com.mysql.jdbc.PreparedStatement; 무조건 삭제, import java.sql.*;로 선언해줘야됨



public class delete_sql {

	
	public String delfaq(String inx) {
		
		String msg = null; //리턴보낼변수
		Connection ct = null;
		dbcon db = null;
		try {
		
		//db연결이 안되면 코드 출력안됨. 확인하는게 좋음.
		db = new dbcon();
		ct = db.cafe24();
		
		String sql ="delete from faq_board where inx='"+inx+"'";
		PreparedStatement ps = ct.prepareStatement(sql);
		
		int n = 0;
		n = ps.executeUpdate();
				
		if(n>0) {
			msg="ok";
			
		}else {
			throw new Exception("error");
			
		}
		}catch(Exception e) {
			msg="no";
			}finally {
			
				try{
				ct.close();
			}catch(Exception x) {
				System.exit(0);
				
			}
				
			}
		
		return msg;
		
	} 
	
	
	
}
