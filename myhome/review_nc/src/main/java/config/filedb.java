package config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class filedb {
	dbconfig db = null;
	java.sql.Connection con =null;
	public filedb(){
		try {
			
			this.db = new dbconfig();

			this.con = this.db.con();
			
		}catch(Exception e) {
			
		}
		
		
	}
	
	
public void fileinsert(String fnm) throws ClassNotFoundException, SQLException{

	//이미지를 sql로 저장
	
	String sql = "insert into imgs (imdx, imurl) values ('0','"+fnm+"') ";
	PreparedStatement ps = this.con.prepareStatement(sql);
	
	int n=0;
	n = ps.executeUpdate();
	
	
	
	 }	
}
