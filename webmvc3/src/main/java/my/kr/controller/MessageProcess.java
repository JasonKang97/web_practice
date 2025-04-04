package my.kr.controller;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

// 컨트롤러
public class MessageProcess implements CommandInter{
	@Override
	public String showData(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 모델은 이미 수행 했다고 가정
		String message = "1강의실";	// 모델이 반환한 값
		
		request.setAttribute("data", message);
		
		return "view1.jsp";
	}
}
