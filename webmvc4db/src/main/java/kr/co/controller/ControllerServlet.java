package kr.co.controller;

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
		
		// 처리를 위임할 인터페이스 운영
		CommandInter inter = null;
		String viewName = "/WEB-INF/views/";
		
		try {
			if(command.equals("jikwon")) {
				
			}else if(command.equals("gogek")) {
				
			}else if(command.equals("sangpum")) {
				inter = new SangpumImpl();
				viewName += inter.showData(request, response);
				request.getRequestDispatcher(viewName).forward(request, response);
			}else {
				viewName = "error.html";
				response.sendRedirect(viewName);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
