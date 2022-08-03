package configure;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class loginok extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public loginok() {
    }

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// MVC :컨트롤파트 
		//뷰, 모듈 연결 
	request.setCharacterEncoding("utf-8");
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	
	
	/*password는 암호화가 되어 있으므로 (데이터베이스에) base64로 변환 후 값 전달*/
	join_module jm = new join_module();
	String passwd = jm.pass_sc(userpw);
//	System.out.println(passwd);   //password가 암호화 되서 넘어와야됨. system.print로 확인.
	
	//loginok_module에서 return 받음, dbcon 형태와 같다라고 생각하면 좋음.

	response.setContentType("text/html;charset=utf-8");
	
	try {
		
		//loginok_module 불러오기, 단 loginok_module에 exception 걸려있으므로 try~catch 예외처리 필요
	
		loginok_module lm = new loginok_module(); 
		loginok_module lm2 = lm.getter(userid, passwd);   //loginok_module의 this값이 넘어옴
		
		PrintWriter pr = response.getWriter();
		
		if(lm2.msg.intern()=="nojoin") {  // 로그인 실패
			pr.write("<script>alert('아이디 및 패스워드를 다시 확인하세요.ㅋ'); history.go(-1); </script>");

		}else {   //로그인 성공
			//세션등록 session : 브라우저에 임의값을 등록하여 컴퓨터 종료 될때가지 클라이언트 메모리에 등록시키는 작업 (비슷한개념으로 쿠키..)
			
			HttpSession session = request.getSession();
			session.setAttribute("pid", lm2.u);
			session.setAttribute("pmn", lm2.n);
			
			//setAttribute: 가상의 이름 및 실제 값을 넣어서 대입. 
			
			pr.write("<script>alert('로그인 하셨습니다.ㅋ'); "
					+ "location.href='./loginok.jsp'"   //바로 설ㅈ어함..
					+ " </script>");
			
			
		//  sendRedirect : 작업완료 후 자동으로 페이지를 이동할 때 사용함..
		//	response.sendRedirect("./loginok.jsp");  //jsp 가 뷰 역활을 함
			
			
				}
		
//		System.out.println(lm2.u); 
//		System.out.println(lm2.p);
		System.out.println(lm2.msg);
		
		
	}catch(Exception e) {
		
	}
	
	
	
	
	
	
	}

}
