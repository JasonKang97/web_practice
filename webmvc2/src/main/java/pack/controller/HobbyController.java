package pack.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pack.model.HobbyModel;

import java.io.IOException;
import java.util.ArrayList;


//@WebServlet("*.do")
public class HobbyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HobbyModel hobbyModel;
	
	@Override
	public void init() throws ServletException {
		hobbyModel = new HobbyModel();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 컨트롤러가 하는 작업
		
		// 1) 클라이언트로부터 요청 수신
		String hobby = request.getParameter("hobby");
		
		
		// 2) 모델 영역 내 특정 클래스 수행 후 결과 반환
		//	hobby 요청 처리 작업 단위------------------------
		ArrayList<String> list =  hobbyModel.getHobby(hobby);
		request.setAttribute("datas", list);
		String viewName = "/WEB-INF/views/hobbyresult.jsp";
		//------------------------------------------------
		
		// 다름 요청에 대한 작업 단위-------------------------
		
		// ...
		
		//------------------------------------------------

		
		// 3) 뷰 영역 내의 특정 jsp(html)를 호출
		request.getRequestDispatcher(viewName).forward(request, response);
		
	}

}
