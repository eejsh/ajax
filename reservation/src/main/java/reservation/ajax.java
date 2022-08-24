package reservation;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajax.jsp")
public class ajax extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;
       
    public ajax() {
    }
    
    
    //doput , dodelete : ajax 전용
    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	req.setCharacterEncoding("utf-8");
    	resp.setContentType("text/html; charset=utf-8");
    	
    	String id = req.getParameter("id").intern();
    	String sign = null;
  
    	if(id=="hong") {
    		sign="ok";
    		
    	}else {
    		sign="no";
    	}
    	PrintWriter pw = resp.getWriter();
    	pw.write(sign); // ajax 통신의 따른 return , 빈공간이 없음..
   
    	//json은 빈공간있어서 후처리해야됨.(Jsonpaser)
        //ajax 는 jsp 보다 servlet 으로 제작하면 좋음. 
    	// 단점은 servlet 구성.. xml... , select 데이터베이스 검색..
    	
    	
    	//jsp는 라이브러리 필요.. json-simple
    	
    }
    
    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	// 어플에서는 post, get 사용이 안됨
    	//doDelete 어플전용 ajax - 삭제 파트
    	
    
    }

}
