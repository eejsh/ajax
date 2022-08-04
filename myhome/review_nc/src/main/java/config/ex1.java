package config;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;




@MultipartConfig(   //파일 업로드 기능 처리 시 사용되는 어노테이션 속성      
      fileSizeThreshold = 1024 * 1024 * 1,   //1MB(파일 업로드 시 사용되는 메모리 임시크기 용량)
      maxFileSize = 1024 * 1024 * 2,   //2MB(업로드 파일 최대 크기값)
      maxRequestSize = 1024 * 1024 * 2   //2MB(전송에 따른 최대 크기값)
)

public class ex1 extends HttpServlet {
   String rnm,rpdnm,rscore,rcontent;
   private static final long serialVersionUID = 1L;
       

    public ex1() {

    }


   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

   }


   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      String filename = null;
      String path = null;
      String upload = null;
      String url=null;
      String url2=null;
      //HTML에서 enctype을 확인함
      //String enctype = request.getMethod();   //form post형태
      String enctypec = request.getContentType();   //enctype
      //System.out.println(enctypec);
      
      if(enctypec.equals("application/x-www-form-urlencoded")) {
         this.rnm = request.getParameter("usernm");
         this.rpdnm = request.getParameter("pdnm");
         this.rscore = request.getParameter("rdscore");
         this.rcontent = request.getParameter("content");
      }else {
         //URLDecoder.decode : multipart/form-data 역해석, 문자셋 써줘야 안깨짐
         this.rnm = URLDecoder.decode(request.getParameter("usernm"),"UTF-8");
         this.rpdnm = URLDecoder.decode(request.getParameter("pdnm"),"UTF-8");
         this.rscore = URLDecoder.decode(request.getParameter("rdscore"),"UTF-8");
         this.rcontent = URLDecoder.decode(request.getParameter("content"),"UTF-8");
         Part part = request.getPart("file");
         filename=part.getSubmittedFileName().intern();
         
         
      }
      
      
      response.setContentType("text/html; charset=utf-8");
      PrintWriter pr = response.getWriter();
      
      
      //config cff = new config();
      ex1_jv conff = new ex1_jv();
      
      String indate = conff.nowtimer();
      String outdate = "0001-01-01 01:00:00";
      if(filename=="") {
         url2=null;
      }else {
         path = request.getServletContext().getRealPath("");
         upload = path+"upload/";   //실제 저장 공간
         url = upload+filename;
         url2 = url.replace("/jwe06120/tomcat/webapps", ".");   //db에 저장되는 경로
         for(Part p : request.getParts()) {
            p.write(url);
         }
         
      }
      String[] data = {"pd_review",this.rnm,this.rpdnm,this.rscore,this.rcontent,indate,outdate,url2};
      ArrayList<String> ar = new ArrayList<String>(Arrays.asList(data));
      
      String sign = conff.insert01(ar).intern();
      
      if(sign=="ok") {
         pr.print("<script>"
               + "alert('리뷰작성이 완료되었습니다.'); location.href='./index.jsp';"
               + "</script>"); //나중엔 index.jsp로 이동되게..(쓴 리뷰 목록 있는 곳..)
         
      }else {
         pr.print("<script>"
               + "alert('올바른 값이 아닙니다.'); location.href='./index.jsp';"
               + "</script>");
      }
      
      
      /*
      request.setCharacterEncoding("utf-8");
      this.rnm = request.getParameter("usernm");
      this.rpdnm = request.getParameter("pdnm");
      this.rscore = request.getParameter("rdscore");
      this.rcontent = request.getParameter("content");
      
      Part filepart = request.getPart("file");
      String filename = filepart.getSubmittedFileName().intern;
      String url2=null;
      if(filename=="") {
         //Part filepart = request.getPart("file");
         
         
         
         String path = request.getServletContext().getRealPath("");
         String upfile = path+"upload/";
         
         String url = upfile+filename;
         url2 = url.replace("C:\\myhome\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\review_nc\\", "./review_nc/");
         //System.out.println(url);
         //System.out.println(url2);
         
         for(Part p : request.getParts()) {
            p.write(url);
         }
      }
      
      

      
      insertReview ir = new insertReview();
      ArrayList<String> list = new ArrayList<String>();
      list.add(this.rnm);
      list.add(this.rpdnm);
      list.add(this.rscore);
      list.add(this.rcontent);
      
      list.add(url2);
      try {
         ir.insert(list);
      } catch (Exception e) {
         
      }
      
      
      String r = ir.message().intern();
      response.setContentType("text/html; charset=utf-8");
      PrintWriter pr = response.getWriter();

      if(r=="ok") {
         pr.print("<script>"
               + "alert('리뷰작성이 완료되었습니다.'); location.href='./review_write.html';"
               + "</script>");
      }else {
         pr.print("<script>"
               + "alert('올바른 값이 아닙니다.'); location.href='./review_write.html';"
               + "</script>");
      }
      */
      
      
   }

}