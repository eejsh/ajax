package pro;

import java.sql.*;
import java.util.ArrayList;

public class select_sql {
	private String idx = null;
	

	private String fcate = null;
	private String fwrite = null;
	private String faq_qc = null; //질문내용
	private String faq_view = null;
	private String faq_indate = null;
	
	public String getIdx() {
		return idx;
	}
	
	
	public String getFcate() {
		return fcate;
	}
	public String getFwrite() {
		return fwrite;
	}
	public String getFaq_qc() {
		return faq_qc;
	}
	public String getFaq_view() {
		return faq_view;
	}
	public String getFaq_indate() {
		return faq_indate;
	}
	

	public void setIdx(String idx) {
		this.idx = idx;
	}
	
	public void setFcate(String fcate) {
		this.fcate = fcate;
	}
	public void setFwrite(String fwrite) {
		this.fwrite = fwrite;
	}
	public void setFaq_qc(String faq_qc) {
		this.faq_qc = faq_qc;
	}
	public void setFaq_view(String faq_view) {
		this.faq_view = faq_view;
	}
	public void setFaq_indate(String faq_indate) {
		this.faq_indate = faq_indate;
	}

	public ArrayList<select_sql> viewdata() throws ClassNotFoundException, SQLException{
		
		ArrayList<select_sql> list = new ArrayList<>();
		select_sql ss = new select_sql();
		
		dbcon db = new dbcon();
		db.cafe24();
		
		Connection con = db.cafe24();
		String sql= "select * from faq_board order by faq_indate asc" ; 
		PreparedStatement ps = con.prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			ss.setIdx(rs.getString("idx"));
			ss.setFcate(rs.getString("fcate"));
			ss.setFwrite(rs.getString("fwirte"));
			ss.setFaq_qc(rs.getString("faq_qc"));
			ss.setFaq_view(rs.getString("faq_view"));
			ss.setFaq_indate(rs.getString("faq_indate"));
		list.add(ss);
		
		}
		
		return list; 
		
	}
	
	
	
	
	
	
	
}
