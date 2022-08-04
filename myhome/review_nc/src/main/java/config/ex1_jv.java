package config;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

public class ex1_jv {

		protected LocalDateTime now = null;
		protected String msg = null;

		protected String nowtimer() { // 현재 서버 시간 관련 정보
			this.now = LocalDateTime.now();
			DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

			String timer = this.now.format(fm);
			return timer;

		}

		protected String insert01(ArrayList<String> data) { // 인서트만 사용

			String table_name = data.get(0);
			int w = data.size() - 1;

			System.out.println(w);
			String sql = "insert into" + table_name + "values('0' ";

			while (w < data.size()) {

				if (w == data.size() - 1) {
					sql += "?)";
				} else {
					sql += "?,";
				}
				w++;
			}
			
			
			
			
			try {

				dbconfig db = new dbconfig();
				Connection ct = db.con();
				PreparedStatement ps = ct.prepareStatement(sql);

				ps.setString(1, data.get(0));
				ps.setString(2, data.get(1));
				ps.setString(3, data.get(2));
				ps.setString(4, data.get(3));
				ps.setString(5, data.get(4));
				ps.setString(6, data.get(5));
				ps.setString(7, data.get(6));
				
			
				
				int n = 0;
				if (n > 0) {
					this.msg = "ok";
				} else {
					throw new Exception("error");
				}
			} catch (Exception ex) {
				this.msg = "no";
			} finally {
				// database mysql-close
			}
			return msg;

		
		}
	}

