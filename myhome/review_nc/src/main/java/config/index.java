package config;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public index() {
    }

    
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	try {
    		
    		
    		//dl 모듈에서 받아오는 파트
    		dataload dl = new dataload();
    		ArrayList<dataload> list = dl.all_list();
    		req.setAttribute("list", list);  //dataload 의 list가져오기.  데이터는 jsp로 넘어감
    		   		
    		
    		
    		//서블릿에서 jsp로 넘겨주는 파트 
    		//서블릿에 있는 데이터를 index.jsp로 넘어가서 뷰어가 됨.
    		RequestDispatcher rd = req.getRequestDispatcher("/index.jsp");
    		rd.forward(req, resp);   		  //뷰어
    		
    		
    		
    		
    	}catch(Exception e) {
    		
    		
    	}
    	
    	
    	
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
