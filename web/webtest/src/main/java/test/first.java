package test;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URL;
import java.nio.charset.Charset;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class first extends HttpServlet {

	   PrintWriter pr = null;   //javascript사용할 수 있음

	
	
	private static final long serialVersionUID = 1L;

   public first() {
    
   }

   public void init(ServletConfig config) throws ServletException {

   }
   //doGet : front에서 GET으로 전송, 또는 ajax에서 get전송
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      //request: get, post 던 전송된 정보 데이터를 말합니다.
      //response: 결과값을 출력하는 형태
      request.setCharacterEncoding("utf-8");  //ajax 또는 formㅇ에서 넘어온 문자를 인코딩해줌.
      response.setContentType("text/html; charset=utf-8");
      pr = response.getWriter();
      String mid = request.getParameter("mid").intern();  // 넘어온 파라미터 값.
         System.out.println(mid);
      
      
      JSONParser jp = new JSONParser();
      try {
    	  
         
         URL url = new URL("http://eejsh08.cafe24.com/webtest/index3.json");
         InputStream in = url.openStream(); //openStream :URL전용
       //InputStreamReader is = new InputStreamReader(in, "utf-8");
         
         BufferedReader br = new BufferedReader(new InputStreamReader(in,Charset.forName("UTF-8")));
         int a;
         //String(문자열) : 변경 불가능한 문자열 또한 생성
         //StringBuilder(문자열) : 문자만 생성 - append 추가가능
         StringBuilder sb = new StringBuilder();
         while((a = br.read()) != -1) {
            sb.append((char)a);
         }
         String data = sb.toString();
         /*
          * json, xml 파일은 숫자, 문자가 무조건 혼합되어 있음. (숫자랑 문자가 무조건 섞여있으므로 json은 object만 사용.)
          * JSONObject : json parse를 사용할 때 적용됩니다. 
          * JSONArray : 배열에 대표키가 있을 경우 사용 (배열에서 바로 배열이 있을시 object, 키가 있을 경우 jsonarray
          * */
         
         JSONObject js =(JSONObject)jp.parse(data);
         JSONArray ba = (JSONArray)js.get("members");  //members 대표키 .get(키이름)
         
         
       
         int w =0;
         while(w<ba.size()) {
        	 JSONObject d = (JSONObject)ba.get(w);
        	// System.out.println(d.get("area").toString());
        	// System.out.println(d.get("id").toString());
        	// System.out.println(d.get("name").toString());
        	// System.out.println(d.get("phone").toString());
             String id = d.get("id").toString().intern();
             if(id==mid) {
                pr.print("<script>alert('해당 아이디를 확인하였습니다.'); history.go(-1);</script>");
                pr.close();
             }
             w++;
          }
         in.close();
         br.close();
         
         /*
         FileInputStream fi = new FileInputStream("C:\\web\\webtest\\src\\main\\webapp\\index3.json");
         InputStreamReader is = new InputStreamReader(fi,"UTF8");
         JSONObject jo = (JSONObject)jp.parse(is);
         System.out.println(jo);
         is.close();
         fi.close();
         */

      }
      catch(Exception e) {
         
      }
      
   }
   //doPost : front에서 POST로 전송, 또는 ajax에서 post전송
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//      doGet(request, response);
   }
   

}