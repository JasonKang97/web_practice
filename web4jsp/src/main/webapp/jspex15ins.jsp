<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 수신된 입력자료를 DB에 저장 후 상품정보 보기 창으로 이동.
request.setCharacterEncoding("utf-8");
//String sang = request.getParameter("sang");
// 폼빈 사용
%>
<jsp:useBean id="formBean" class="pack.SangpumFormBean"/>
<jsp:useBean id="dbConnPaging" class="pack.DbConnPaging"/>
<jsp:setProperty property="*" name="formBean"/>
<%-- 자바에서도 입력자료 검사 권장 --%>
<%
if(formBean.getSang().equals("") || formBean.getSang() == null){	// sang, su, dan도 해주어야함. su와 dan은 숫자만 허용.
	response.sendRedirect("jspex15insert.html");
	return;
}

dbConnPaging.sangpumInsert(formBean);

// 상품 추가 후 목록보기로 이동: forward 방식으로 하면 안됨.
//request.getRequestDispatcher("jspex15paging.jsp").forward(request, response);

// 상품 추가 후 목록보기로 이동: redirect
response.sendRedirect("jspex15paging.jsp");

%>
