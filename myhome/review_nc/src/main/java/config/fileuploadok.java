package config;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Collection;

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


//데이터 최대 용량을 정해야됨
public class fileuploadok extends HttpServlet {
   private static final long serialVersionUID = 1L;
       

    public fileuploadok() {

    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      // Part filepart = request.getPart("file");  // 사용자 PC에 있는 이미지 경로를 저장합니다.(임의저장, 휘발성) 
	  // 파일 경로를 가져와야됨. 사용자 경로 , 파일명 체크
      // System.out.println(filepart);
      // String filename = filepart.getSubmittedFileName();   //업로드 할 파일명을 가져옴
      // System.out.println(filename);   //이미지 파일 명 한글이면 에러 날 수 있음.. orange.jpg
      // String paths = request.getServletContext().getRealPath("");
      
		
      /*
       * [Stream 없이 사용하는 방식]
      //서버 경로 - 여기에 저장됨.. (나중엔 http로..
      //getServletContext() : 절대경로사항을 체크 (servlet에 대한 환경설정 형태)
      //getRealPath("") : 어플리케이션 실제 경로 출력 (서버 물리 경로)
      String paths = request.getServletContext().getRealPath("");
      System.out.println(paths);   //C:\myhome\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\review_nc\
      
      String savepath = paths + "upload/";   //서버 올릴 때 역슬래시 쓰면 안됨! , 저장할 공간
      
      
      / for.in 여러 첨부파일 업로드 하기 위해 사용.
      for(Part part:request.getParts()) {   //여러개의 파일을 업로드 시 모든 파일을 서버에 저장되도록 하기 위함
         //part.write("C:\\myhome\\review_nc\\src\\main\\webapp\\upload\\"+filename);   //해당 파일을 저장 할 위치에 동일한 이름으로 copy하게 됨
          	//파일 이름 그대로 쓰겟다..
         part.write(savepath+filename);
      }
      */
      
      /*[Stream 있는 형태의 파일 업로드] ㅊㅊ
      InputStream is = filepart.getInputStream();   //getInputStream() - servlet (자바에는 없음..)
      String savepath = paths + "upload/"+filename;   //저장할 공간
      FileOutputStream fo = new FileOutputStream(savepath);   //복사(저장하는 공간)
      
      byte[] bf = new byte[1024*2];   //쪼개는 단위
      ///크게 쪼개는게 좋음(메모리 성능 따라감). byte->kb로

      int size = 0;
      while((size=is.read(bf))!=-1) {
         fo.write(bf,0,size);
      }
      fo.close();
      is.close();

      response.getWriter().print("ok");
      */
      
      
   //========================================
   //[multiple 사용시] collection : 서블렛에만 있음  JCF[ java collection framework ]
      //collection : 배열형태 (servlet에서 최상위 배열 선언문 , 오브젝트보다 상위개념) 
      
      /* 배열 (array) , 컬렉션 (collection : 데이터배열 ) , Map (맵)
       */
      
      
      Collection<Part> filepart = request.getParts();
      //일반 배열생성 : 파일명 및 파일 속성을 가져올려고 하는 형태 
      ArrayList<Part> result = new ArrayList<Part>(filepart.size());
      
      System.out.println(filepart);
      
      for(Part part : filepart) {
    	  result.add(part);  // 일반 배열 값에 저장
      }
      String filenm = null;
      String paths= request.getServletContext().getRealPath(""); 
      String savepath = paths + "upload/";
      
      int w = 0;
      while(w < result.size()){
    	  filenm = result.get(w).getSubmittedFileName();
    	  result.get(w).write(savepath + filenm);
    	  response.getWriter().print(savepath + filenm +"<br>");
    	  w++;
    	  
    	  System.out.println(filenm);
    	  
      }
      
   
   }

}