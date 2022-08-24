package reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class update2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public update2() {
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       //import java.sql.*; 선언하면 편함!
    	
    	req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter pw = resp.getWriter();
        
        int n=0;
        dbconfig dbc = null;
        Connection con = null;
        String email = "kangkang111@gmail.com";
        String idx = "6";
        
        
        try {
        	dbc = new dbconfig();
        	con = dbc.getConnection();
        	
        	String sql = "update reservation set remail=? where ridx=? ";
        	PreparedStatement ps = con.prepareStatement(sql);
        	
        	ps.setString(1, email);
        	ps.setString(2, idx);
        	
        	ps.executeUpdate();
        	
        	pw.print("정상적으로 정보가 수정되었습니다.");
        	
        }catch(Exception e) {
        	
        }
        
    }
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    //ajax 시 doput 사용
    	/*
  	$.ajax({
		url : "update2.jsp",
		type : "POST", --> "doPUT", (무조건 ajax 전용)   ... 별 차이없음.. 있어보인데욤...ㅋ 
		cache : false,
					});
		<form method="put"> 안됨!!!!!!!!!!
    	 * */
    
    }
    
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
