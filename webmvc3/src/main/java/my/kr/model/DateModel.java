package my.kr.model;

import java.time.LocalDate;
import java.util.ArrayList;

public class DateModel {	// 모델 영역 내 Business Logic
	public ArrayList<String> getDate(){
		LocalDate localDate = LocalDate.now();
		String y = Integer.toString(localDate.getYear());
		String m = Integer.toString(localDate.getMonthValue());
		String d = Integer.toString(localDate.getDayOfMonth());
		
		ArrayList<String> list = new ArrayList();
		list.add(y);
		list.add(m);
		list.add(d);
		
		return list;
	}
	
}
