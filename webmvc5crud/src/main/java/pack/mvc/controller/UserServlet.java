package pack.mvc.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.StringTokenizer;


@WebServlet("*.m2")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ModelAndView modelAndView = null;
	private Controller controller = null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		try {
			// 파일명을 요청 정보로 사용. ex) list.m2인 경우 list를 추출해 요청 정보로 사용	
			String ss = request.getRequestURI();
			//System.out.println(ss);	// /webmvc5crud/list.m2
			int idx = ss.lastIndexOf('/');
			StringTokenizer st = new StringTokenizer(ss.substring(idx+1), ".");
			ss = st.nextToken();
			//System.out.println(ss);	// list
			
			String command = ss;
			controller = getAction(command);
			modelAndView = controller.execute(request, response);
			
			// 파일 호출 방식 선택 후 view 파일을 클라이언트에게 전송
			if(modelAndView.isRedirect()) {	// redirect
				response.sendRedirect(modelAndView.getViewName());
			}else {	// forwarding
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/" + modelAndView.getViewName());
				dispatcher.forward(request, response);
			}
			
		} catch (Exception e) {
			System.out.println("service err: " + e);
		}
	}
	
	public Controller getAction(String command) throws Exception{
		if(command.equals("list")) {
			controller = new ListController();
		}else if(command.equals("login")) {
			controller = new LoginController();
		}else if(command.equals("logout")) {
			controller = new LogoutController();
//		}else if(command.equals("insert")) {
//			controller = new InsertController();
//		}else if(command.equals("view")) {
//			controller = new ViewController();
//		}else if(command.equals("updateform")) {
//			controller = new UpdateFormController();
//		}else if(command.equals("update")) {
//			controller = new UpdateController();
//		}else if(command.equals("delete")) {
//			controller = new DeleteController();
		}
		
		return controller;
	}
	
}
