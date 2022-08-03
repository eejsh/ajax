package configure;

import java.sql.*;
//mvc : Module 파트

public class loginok_module {
	protected Connection ct = null;

	//페이지 이동시 로그인 유지될수 있게 하기위해 필드에 변수넣어야됨
	String u = null;
	String n = null;
	String msg = null;
	
	//loginok로 넘김 (userid,userpw),
	//ex : public void userinfo(String userid, String usernm){this.~~ } 아이디 이름 두개 한번에 사용해도됨..
	public void user(String userid) {
		this.u = userid;
	}
	
	public void name(String username) {
		this.n = username;     
	}
	
	public void message(String message) { 
		this.msg = message;
		
	}
	
	
	public loginok_module() throws ClassNotFoundException, SQLException{
//		dbconfig dc = new dbconfig();  사용안함
//		this.ct = dc.dbcon();   //database -> throw 필수.. (classnot~~, sqlexception 걸려있음) or try catch
	}
	
	
	//class 형태의 메소드 getter, setter 사용 이유 :  자료형의 구분 없이 사용하기 위함..
	// object 개념, loginok_module String 으로 하면 무조건 문자로만 받기 때문에 getter(String a, String b) 형식으로사용함(ex int로 넘어올수잇음..)
	public loginok_module getter(String userid, String userpw) { //getter return , loginok.java로 넘김
		//원래는 protected로 올려서 사용해야됨 String... 등.
		
		loginok_module ld = null;
		
		try {
			
			dbconfig dc = new dbconfig();
			this.ct = dc.dbcon();   
			
			ld = new loginok_module();  // class 인스턴트 작용함
			
		/* !중요!
		 * sql 문법은 해당 값이 잘못 되었을 경우 또는 필드명이 잘못 될 경우 해당 문법을 세그먼트를 꼭 찍어서 확인 하셔야 합니다.
		 * 암호화가 있을 경우 무조건 암호화 값이 들어가야만 확인이 정상적으로 이루어 집니다.
		 * 
		 * 해당 필드 값만 가져와서 사용할 경우 각각의 필드명을 입력하시면 됩니다. 
		 * id 값만 가져오고싶으면 select mid from person.. password는 수정할때만 가져오면됨.
		 */
			
			
			String sql = "select mid, mpass, mname from person where mid=? and mpass=? ";
		//	String sql = "select mid, mpass, mname from person where mid='' and mpass='' ";
			
			PreparedStatement ps = this.ct.prepareStatement(sql);
			ps.setString(1, userid);   //sql 1번=mid
			ps.setString(2, userpw);   //sql 2번=mpass
			
		//	System.out.println(ps); database 확인해보기.
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next()==false) {  //false : 데이터 없을시.
				
				ld.message("nojoin");   //사용자가 없으면 nojoin 표시(강제로 선언)
		
			}else {
//				System.out.println(rs.getString("mid"));
//				System.out.println(rs.getString("mname"));
		
				ld.message("okjoin");

				//void 메소드로 this를 적용시켜줌, loginok.java에서 this 값을 바로 load하기 위해 사용
				ld.user(userid);    
				ld.name(rs.getString("mname"));
				
			}
			
		}catch(Exception e) {
			
		}
		
		return ld;
		
	}
	
	
	
}
