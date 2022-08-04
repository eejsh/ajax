package config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class dataload {

	private String midx;
	private String mid;
	private String mgrade;
	private String mtext;
	private String indate;
	private String imgs;
	
	
	
	//servlet setter
	public void setmidx(String midx) {
		this.midx = midx;
		
	}
	
	public void setmid(String mid) {
		this.mid = mid;
		
	}
	
	public void setmgrade(String mgrade) {
		this.mgrade = mgrade;
		
		
	}
	

	////getter, jsp에서 가져와서 출력
	
	
	public String setmidx() {
	return this.midx ;
		
	}
	
	public String setmid() {
	return	this.mid ;
		
	}
	
	public String setmgrade() {
	return this.mgrade;
		
		
	}
	
	public ArrayList<dataload> all_list(){ //배열값선언..
		
		
		
		ArrayList<dataload> list = new ArrayList<>();
		
		try {
			
			dbconfig db = new dbconfig();
			Connection ct = db.con();
		
			String sql = "select * from pd_review";
			PreparedStatement ps  = ct.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				dataload dl = new dataload();
				dl.setmidx(rs.getString("midx"));    //setmidx =>setter
				dl.setmid(rs.getNString("mid"));
				dl.setmgrade(rs.getString("mgrade"));
				list.add(dl);
				
			}
			System.out.println(list.toString());
			
		}catch(Exception e) {
			
		}
		
		return list;
		
	}
	
	
	
	
	
	
	
	
}
