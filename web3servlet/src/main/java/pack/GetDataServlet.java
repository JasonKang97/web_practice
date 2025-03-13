package pack;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet implementation class GetDataServlet
 */
@WebServlet("/GetDataServlet")	// 논리적인 요청명: '/GetDataServlet'을 GetDataServlet.java와 매핑.
public class GetDataServlet extends HttpServlet {	// 물리적인 파일명: GetDataServlet
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get 요청 처리 전용 메소드
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		System.out.println(name + " " + age);	// 개발자를 위한 코드
		
		// 클라이언트로 전송할 코드를 작성
		response.setContentType("text/html;charset=utf-8");	// Mime type과 문자 코드 설정
		PrintWriter out = response.getWriter();
		out.println("<html><body>");
		out.println("<h3>서버가 전송한 자료 확인(get)</h3>");
		out.println(name + "님의 나이는 " + age);
		out.println(calcAge(age));	// 사용자 작정 메소드 호출		
		out.println("<br><br><a href='getdata.html'>자료 다시 입력</a>");
		out.println("</body></html>");
		out.close();
	}
	
	private String calcAge(String age){
		int imsi = Integer.parseInt(age)/10*10;
		String result = "";
		switch(imsi) {
		case 20: result = "이십대"; break;
		case 30: result = "삼십대"; break;
		case 40: result = "사십대"; break;
		default: result = "기타";
		}
		return result;
	}
}
