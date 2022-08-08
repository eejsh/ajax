package pro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class faq_del extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public faq_del() {
    }
    
    //파라미터
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//html에는 숫자가 없음. 문자로 전송됨.
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		PrintWriter pr = response.getWriter();
		
		String inx = request.getParameter("inx").intern();
		//if문 사용할 때 intern 사용.
		
		System.out.println(inx);
		
		if(inx==null || inx=="") { //정상적인 루트로 접속하지 않았을때.
			pr.write("<script>alert('올바른 접근이 아닙니다.'); history.go(-1); </script>");
		}else { //정상적으로 넘어왔을 때
			
			delete_sql ds = new delete_sql();
			String msg = ds.delfaq(inx).intern(); 
			if(msg=="ok") {
				pr.write("<script>"
						+ "alert('해당 데이터가 정상적으로 삭제 완료 되었습니다.');"
						+ "location.href='./faq_list.html';"
						+ "</script>");
			}else {
				pr.write("<script>"
						+ "alert('DB가 올바르지 않습니다.');"
						+ "history.go (-1)';"
						+ "</script>");
			}
			
		}
		
		
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
