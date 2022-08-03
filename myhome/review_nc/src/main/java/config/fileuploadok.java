package config;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig( //파일 업로드 기능 처리시 사용되는 어노테이션 속성.
		
		fileSizeThreshold = 1024*1024*1,     //1MB (파일 업로드 시 사용되는 메모리 임시크기 용량)
 	maxFileSize = 1024*1024*2 ,   //2MB	  (업로드 파일 최대 크기값)
	maxRequestSize = 1024*1024*2  //2MB   (파일 전송에 따른 최대 크기값) 최대 2메가바이트까지 첨부가능 설정
	
		//multipartconfig :파일 첨부 용량 설정..1~2MB까지 가능..
		
		)
//데이터 최대 용량을 정해야됨
public class fileuploadok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public fileuploadok() {
    }

	public void init(ServletConfig config) throws ServletException {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
	
			
			Part filepart = request.getPart("file");  // 사용자 PC에 있는 이미지 경로를 저장합니다.(임의저장, 휘발성) 
			// 파일 경로를 가져와야됨. 사용자 경로 , 파일명 체크
			
			String filename= filepart.getSubmittedFileName(); // 업로드 할 파일 명을 가져옴. 
			//System.out.println(filename);
			//System.out.println(filepart);
			
			for(Part part:request.getParts()) {
				//여러개의 파일을 업로드 시 모든 파일을 서버에 저장 되도록 하기 위함. for.in 여러 첨부파일 업로드 하기 위해 사용.
				
			 part.write("C:\\myhome\\review_nc\\src\\main\\webapp\\upload\\"+filename); 
			 // 해당 파일을 저장할 위치에 동일한 이름으로 copy하게 됩니다. 
			 
				
				//파일 이름 그대로 쓰겟다..
				
			}
			response.getWriter().print("ok");
			

			
			
	}

}
