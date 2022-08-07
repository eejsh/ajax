package config;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
@MultipartConfig(   //파일 업로드 기능 처리 시 사용되는 어노테이션 속성      
		fileSizeThreshold = 1024*1024*1,     //1MB (파일 업로드 시 사용되는 메모리 임시크기 용량)
 	maxFileSize = 1024*1024*2 ,   //2MB	  (업로드 파일 최대 크기값)
	maxRequestSize = 1024*1024*2  //2MB   (파일 전송에 따른 최대 크기값) 최대 2메가바이트까지 첨부가능 설정
	
		//multipartconfig :파일 첨부 용량 설정..1~2MB까지 가능..
)
public class review_nc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public review_nc() {
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
	
	    
	    String file4 = null;
	    
	    if(filename1=="") {
	    	file4 = null;
	    }else {
	    	
	   //	String file3 = file2.replace("C:\\myhome\\metadata\\plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", ".\review_nc");
	    
	   // 	String file3 = file2.replace("\\Users\\jsh\\Desktop\\home\\metadata\\plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\", ".\review");
		    	
	    	String file3= file2.replace("/eejsh08/tomcat/webapps", ".");    //DB 경로 
	    	file4 = file3 + filename1;
	    	
	    	for(Part p : request.getParts()){  //parts: 여러파일..
	    		p.write(file2 + filename1);	
	    	}
	  
	    }
	    
	    
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
	
	    if(ookk=="ok") {
	    	pr.print("<script>alert('내용이 저장되었슴...'); location.href='./index.do' </script>");
	    	
	    }else {
	    	pr.print("<script>alert('데이터가 올바르지 않습니다..ㅜ'); location.href='./review_write.html' </script>");
	    	
	    }
	    
	}

}
