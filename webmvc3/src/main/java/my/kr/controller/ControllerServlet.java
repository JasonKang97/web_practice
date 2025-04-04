package my.kr.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("*.do")
public class ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		String viewName = "/WEB-INF/views/";
		
		// 컨트롤러 작업을 다른 클래스에게 위임
		CommandInter inter = null;
		
		try {
			if(command.equals("message")) {
				inter = new MessageProcess();
			}else if(command.equals("date")) {
				inter = new DateProcess();
			}
			
			viewName += inter.showData(request, response);
			request.getRequestDispatcher(viewName).forward(request, response);
		} catch (Exception e) {
			System.out.println("컨트롤러 서비스 에러: " + e);
		}
	}

}
