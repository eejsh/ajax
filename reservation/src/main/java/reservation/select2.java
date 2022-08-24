package reservation;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class select2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public select2() {
    }
    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html; charset=utf-8");
        PrintWriter pw = resp.getWriter();
        
        int n=0;
        dbconfig dbc = null;
        Connection con = null;
        
        
        try {
        	dbc = new dbconfig();
        	con = dbc.getConnection();
        	String sql = "select * from reservation where rnm=? and rpw=? and rno=? ";
        	PreparedStatement ps = con.prepareStatement(sql);
        	ps.setString(1, "배고파");
        	ps.setString(2, "bb1234");
        	ps.setString(3, "121454");
        	
        	ResultSet rs = ps.executeQuery();
        	ArrayList<String> al = new ArrayList<String>();
        	
        	//100 개 중 1개의 데이터만 뽑을 경우 get,set 없이 사용가능!
        	
        	while(rs.next()) {
        	//al 배열에 넣는 방법
        	al.add(rs.getString("rnm"));   
        	al.add(rs.getString("remail"));	
        	al.add(rs.getString("rtel"));

        		// 1개식 찍
//        	req.setAttribute("rnm", rs.getString("rnm"));
//        	req.setAttribute("remail", rs.getString("remail"));
//        	req.setAttribute("rtel", rs.getString("rtel"));

        	
        		}
        	
        	req.setAttribute("al", al); // 배열로 보내기.

        	//1개의 데이터 뿌리기. myinfo에서 내정보 출력 시 .. ( id 출력, email, 주소 등)
        	//1개 데이터 get, set 필요없음.
        	
        	//게시판, 공지사항 리스트 중에서 클릭 시 게시판 제목 및 내용 출력시 1개의 데이터만 출력해서 넣어줄수 있음.
        	//단, 게시판 모든 내용 출력시에는 안됨!
        	
        	req.setAttribute("rnm", al.get(0));
        	req.setAttribute("remail", al.get(1));
        	req.setAttribute("rtel", al.get(2));
        	
        	
        	
        	RequestDispatcher rd = req.getRequestDispatcher("./view.jsp");  //다른경로에 있을 시 ./forder/view.jap
        	rd.forward(req, resp);
        	
        	
        	
        	con.close();
        
        }catch(Exception e) {
        	
        }    
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}

