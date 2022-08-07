package pro;

import java.time.*;
import java.time.format.*;

import javax.swing.text.DateFormatter;

public class timer {
	
	private String datetime = null;
	
	public String now_datetime() {  //날짜+시간

		// LocalDate  : 날짜까지만 출력
		
		LocalDateTime lt = LocalDateTime.now();
		DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		this.datetime = lt.format(fm);
		
		
		return this.datetime;
		
	}
	public String now_date() {  //날짜
		
		LocalDate li = LocalDate.now();
		DateTimeFormatter fm = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		
		this.datetime = li.format(fm);
		
		return this.datetime;
		
	}
	
}
