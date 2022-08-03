package configure;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class joinok extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    
	//ck는 data에저장할것이 아님.. mid부터 변수 가져와야됨!
	String mid, mpass, mname, memail, mtel, mpost, maddr1, maddr2;
	
	public joinok() {
    }

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//배열값으로 넘겨주면 좋음..
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf=8");
		
		this.mid = request.getParameter("userid");
		this.mpass = request.getParameter("userpw");
		this.mname = request.getParameter("usernm");
		this.memail = request.getParameter("useremail");
		this.mtel = request.getParameter("usertel");
		this.mpost = request.getParameter("addr1");
		this.maddr1 =request.getParameter("addr2");
		this.maddr2 = request.getParameter("addr3");
		
		System.out.println(this.mid+" "+this.mpass+" "+this.mname+" "+this.memail+" "+this.mtel+" "+this.mpost+" "+this.maddr1+" "+this.maddr2);
		
		join_module jm = new join_module();   
		
		this.mpass = jm.pass_sc(this.mpass);  //base64 변환
		
		ArrayList<String> list  = new ArrayList<String>();
		
		list.add(this.mid);
		list.add(this.mpass);
		list.add(this.mname);
		list.add(this.memail);
		list.add(this.mtel);
		list.add(this.mpost);
		list.add(this.maddr1);
		list.add(this.maddr2);
		
	//	System.out.println(list);
		jm.insert(list);
		//입력값이 많으면 모듈에서 처리해주어야 합니다../
		
		
		String r = jm.join_msg().intern();
		PrintWriter pr = response.getWriter();
		
		if(r=="ok") {   //intern 적용해야 ==로 비교가능..
			pr.print("<script>alert('회원가입이 정상적으로 등록 완료 되었습니다.'); location.href='./index.html'; </script>");
			
		}else {
			pr.print("<script>alert('데이터가 올바르지 않습니다.'); location.href='./join.html'; </script>");

		}
		
		
		
			
	}

}
