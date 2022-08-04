package config;

import java.lang.reflect.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.apache.tomcat.jni.Local;

public class reviewok_module {

    static String call = null;
    
	
	public void insert(ArrayList<String> data) {  //review_nc.java에서 넘어옴.
		
		
		System.out.println(data);
		try {
			
			LocalDateTime time = LocalDateTime.now();
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
			String today = time.format(dtf);
			
			dbconfig dc = new dbconfig();
			Connection ct = dc.con();
			
			
			String sql = "insert into pd_review values ('0',?,?,?,?,'"+today+"','0001-01-01 01:00:00',?); ";
			PreparedStatement ps = ct.prepareStatement(sql);
			
			System.out.println(sql);

			
//			ps.setString(1, data.get(0));
//			ps.setString(2, data.get(1));
//			ps.setString(3, data.get(2));
//			ps.setString(4, data.get(3));
//			ps.setString(5, data.get(4));
//			ps.setString(6, data.get(5));
//			ps.setString(7, data.get(6));
//			
			int w =1;
			while(w <= data.size()) {
				ps.setString(w, data.get(w-1));
				w++;
			}
			
			int n =0;
			n = ps.executeUpdate();
			if(n > 0) {
				this.call = "ok";
				
			}else {
				throw new Exception("error");
			}
			
			
		}catch(Exception e) {
			this.call ="no" ;
			
			
		}
		
	}
	
	public String reok() {  //review_nc로 리턴 null
		
		System.out.println(this.call);
		return this.call;
		
	}
	
	
	
}
