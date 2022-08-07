package pro;

import java.sql.*;
import java.util.ArrayList;

public class select_sql {
	private String inx = null; // 고유값
	private String fcate = null; // 카테고리
	private String faq_qc = null; // 제목
	private String fwrite = null; // 글쓴
	private String indate = null;

	public void setinx(String inx) {
		this.inx = inx;
	}

	public void setFcate(String fcate) {
		this.fcate = fcate;
	}

	public void setFaq_qc(String faq_qc) {
		this.faq_qc = faq_qc;
	}

	public void setFwrite(String fwrite) {
		this.fwrite = fwrite;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public String getinx() {
		return inx;
	}

	public String getFcate() {
		return fcate;
	}

	public String getFaq_qc() {
		return faq_qc;
	}

	public String getFwrite() {
		return fwrite;
	}

	public String getIndate() {
		return indate;
	}

	public ArrayList<select_sql> viewdata() throws ClassNotFoundException, SQLException {

		ArrayList<select_sql> list = new ArrayList<>();
		
		dbcon db = new dbcon();
		db.cafe24();
		
		Connection con = db.cafe24();
		
		String sql= "select * from faq_board;" ; 
//		String sql = "select inx, fcate, fwrite, faq_qc, indate from faq_board; ";
		
		
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
	
		while (rs.next()) {
			select_sql ss = new select_sql();
			ss.setinx(rs.getString("inx"));
			ss.setFcate(rs.getString("fcate"));
			ss.setFwrite(rs.getString("fwrite"));
			ss.setFaq_qc(rs.getString("faq_qc"));
			ss.setIndate(rs.getString("indate"));
			list.add(ss);
			
			
	//System.out.println(list.toString());
			
		}

		return list;

	}

}
