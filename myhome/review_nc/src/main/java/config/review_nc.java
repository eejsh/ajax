package config;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.WriteAbortedException;
import java.io.Writer;
import java.lang.reflect.Array;
import java.util.ArrayList;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig(
		
		fileSizeThreshold = 1024*1024*1,
		maxFileSize = 1024*1024*2,
		maxRequestSize = 1024*1024*2
		
		)
public class review_nc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public review_nc() {
    }
	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setCharacterEncoding("utf-8");	
	 
		//HTML 에서 enctype 을 확인함
		
		//String enctype = request.getMethod();  Form Post 형태
		String enctype= request.getContentType(); //multipart/form-data; boundary=----WebKitFormBoundaryVeDIzBkEaFAPLMuF
	    
	    response.setContentType("text/html; charset=utf-8");
	
	    String user = request.getParameter("username"); //고객명
	    String pname = request.getParameter("proname"); //상품
	    String ro = request.getParameter("ro");
	    String usertext = request.getParameter("textbox"); 
	    

	    
	    // 파일 첨부기능
	    
	    
	    Part part1 = request.getPart("file"); 
	    String filename1 = part1.getSubmittedFileName(); //이름 확인
	    
	    
	    String file1 = request.getServletContext().getRealPath("");
	    String file2 = file1 + "upload/";   // 실제 저장 공간

	    System.out.println(file1);
	    System.out.println(file2);
	
	    String file3= file2.replace("/eejsh08/tomcat/webapps", ".");    //DB 경로 
        String file4 = file3 + filename1;
        
	    
	    for(Part p : request.getParts()){  //parts: 여러파일..
	    	
    	p.write(file2 + filename1);	
    	}
	   
	    
	    
	    
//	    Part filepart = request.getPart("file"); //사용자 입력 
//	    String filename = filepart.getSubmittedFileName(); //파일명 가져오기
//	    String paths = request.getServletContext().getRealPath("");  //경로
//	    String upfile = paths +"upload/";
//	    String up1 = upfile + filename ;
//	    String up2 = up1.replace("/eejsh08/tomcat/webapps", ".");
//	    response.getWriter().print(upfile + filename +"<br>");

	    	    
	    
	    reviewok_module rm = new reviewok_module();
	    
	    
	    //유저 입력값 배열저장 후 모듈로 보냄
	    ArrayList<String> list = new ArrayList<String>();
	    list.add(user);
	    list.add(pname);
	    list.add(ro);
	    list.add(usertext);
	    list.add(file4); //파일명
	    
	    
	    rm.insert(list);  //reviewok_module로 보냄.
	   
	   
	    
	    //모듈에서 넘어온 값 처리부분
	    
	    PrintWriter pr = response.getWriter();
	    String ookk = rm.reok().intern();
	   
	   // System.out.println(rm);
	   // System.out.println(ookk);
	    
	    if(ookk=="ok") {
//	    	pr.print("<script>alert('내용이 저장되었슴...'); location.href='./review_write.html' </script>");
	    	pr.print("<script>alert('내용이 저장되었슴...'); location.href='./index.do' </script>");
	    	
	    }else {
	    	pr.print("<script>alert('데이터가 올바르지 않습니다..ㅜ'); location.href='./review_write.html' </script>");
	    	
	    }

	    
	    
	    
	    
	    
	}

}
