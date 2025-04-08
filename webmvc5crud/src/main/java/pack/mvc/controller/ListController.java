package pack.mvc.controller;

import java.util.ArrayList;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pack.mvc.model.ProcessManager;
import pack.mvc.model.UserDto;

public class ListController implements Controller{
	@Override
	public ModelAndView execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 모델을 수행 후 결과 반환
		ArrayList<UserDto> list = ProcessManager.instance().getUserDataAll();		
		request.setAttribute("list", list);
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("list.jsp");
		modelAndView.setRedirect(false);
		return modelAndView;
	}
}
