package config;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
@MultipartConfig(
		fileSizeThreshold = 1024*1024*1,
		maxFileSize = 1024*1024*2,
		maxRequestSize = 1024*1024*2 
		
		)

public class fileok extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public fileok() {
    }

	public void init(ServletConfig config) throws ServletException {
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//파일 첨부 시 multipartconfig 필수.. 
		
		request.setCharacterEncoding("utf-8");
		
	//	String url = "/eejsh08/tomcat/webapps/review_nc/upload/plus.svg";
	//	String url2 = url.replace("/eejsh08/tomcat/webapps/", ".");   // 경로이름 변경
	//	System.out.println(url2);
		
		Collection<Part> parts = request.getParts();  //collection 유틸가져와야됨
		ArrayList<Part> result = new ArrayList<Part>(parts.size());
		for(Part p : parts) {
			result.add(p);
		}
		
		int w=0;
		String filenm = null;
		String path = request.getServletContext().getRealPath(""); //getRealPath(물리경로)어플리케이션 실제경로
		String upfile = path + "upload/";
		String url = null;
		String url2 = null;
		
		
		filedb fdb = new filedb();
		
		///파일 경로 + 파일 이름 을 던짐 -> 저장되는 공간이 있어야함.. =url 추가하면됨
		
		while(w<result.size()){
			filenm = result.get(w).getSubmittedFileName();
			result.get(w).write(upfile + filenm);
			url = upfile + filenm;
			url2 = url.replace("/eejsh08/tomcat/webapps/", ".");
			
			try {
				fdb.fileinsert(url2);
			}catch(Exception e) {
				
			}
			w++;
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
