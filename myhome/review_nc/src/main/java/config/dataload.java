package config;

import java.awt.DefaultKeyboardFocusManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class dataload {

	public String getMidx() {
		return midx;
	}

	public void setMidx(String midx) {
		this.midx = midx;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getMgrade() {
		return mgrade;
	}

	public void setMgrade(String mgrade) {
		this.mgrade = mgrade;
	}

	public String getMproduct() {
		return mproduct;
	}

	public void setMproduct(String mproduct) {
		this.mproduct = mproduct;
	}

	private String midx;
	private String mid;
	private String mgrade;
	private String mproduct;

	// servlet setter

	//// getter, jsp에서 가져와서 출력

	public ArrayList<dataload> all_list() { // 배열값선언..

		ArrayList<dataload> list = new ArrayList<>();

		try {

			dbconfig db = new dbconfig();
			Connection ct = db.con();

			String sql = "select midx, mid, mproduct, mgrade from pd_review;";
			PreparedStatement ps = ct.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				dataload dl = new dataload();
				dl.setMidx(rs.getString("midx")); // setmidx =>setter
				dl.setMid(rs.getString("mid"));
				dl.setMproduct(rs.getString("mproduct"));

				dl.setMgrade(rs.getString("mgrade"));
				list.add(dl);

			}

			System.out.println(list.toString());

		} catch (Exception e) {

		}

		return list;

	}

}
