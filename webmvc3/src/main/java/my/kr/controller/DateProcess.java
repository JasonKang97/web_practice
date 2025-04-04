package my.kr.controller;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import my.kr.model.DateModel;

public class DateProcess implements CommandInter{
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 모델 수행 후 반환 값을 클라이언트에게 전달할 뷰파일명 반환.
		DateModel dateModel = new DateModel();	// 원래는 싱글톤 처리 필요(생략)
		ArrayList<String> list = dateModel.getDate();
		request.setAttribute("naljadata", list);
		
		return "view2.jsp";
	}
}
