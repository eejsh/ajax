package test;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;

import javax.swing.text.html.HTMLEditorKit.Parser;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class jsons {

	public static void main(String[] args) throws Exception {
		
	//	System.out.println("test");
		
	
		JSONParser jp = new JSONParser();
		try {
//	   JSONObject jo = new JSONObject();
//	   jo.put("mid", "hong");
//	   jo.put("mid", "kim");
//	   		System.out.println(jo.toString());
	   	
			
			FileInputStream fi = new FileInputStream("C:\\web\\webtest\\src\\main\\webapp\\index3.json");
			InputStreamReader is = new InputStreamReader(fi, "UTF-8");
		
		JSONObject jo = (JSONObject)jp.parse(is);
		System.out.println(jo);
		is.close();
		fi.close();
		
		}catch(Exception e) {
			
		}
		
		
	
		
	}
	
}
