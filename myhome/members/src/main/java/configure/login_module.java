package configure;

import java.sql.*;

public class login_module {
	
    static String results = null;
	
	public void oksign(String a) { //setter
		this.results = a;
	}
	public String result_check() {  //ok...?
		
		return this.results;     //데이터 있음,없음 유무를 확인하여 loginck로 보냄
	
	}
	
	
	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//원래는 static 사용안함..
	   //데이터베이스.. throws 선언 시 try 사용XX 
		
		dbconfig db = new dbconfig();
		Connection con = db.dbcon();
		
		System.out.println(args[0]);
		
		String sql ="select * from person where mid ='"+args[0]+"' ";
		PreparedStatement ps = con.prepareStatement(sql);
		
		//select resultSet +  executeQuery
	
		int n =0;
		ResultSet rs = ps.executeQuery();  //select 때는 query 사용
	
		
		String backdata = null;
		
		if(rs.next()==true) {  // true : 데이터가 있음
		backdata = "no";	
		 	
		}else {  //false : 데이터가 없음.
		backdata = "ok";
		}
		
		login_module lg = new login_module();
		lg.oksign(backdata);
		
		
	}

}
