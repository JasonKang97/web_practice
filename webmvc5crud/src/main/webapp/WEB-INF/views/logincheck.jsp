<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session = request.getSession(false);	// false일 경우 session이 없으면 만들지 않음
if(session == null || session.getAttribute("userid")==null){
	//response.sendRedirect("login.html");
	out.println("<script>");
	out.println("alert('로그인 후 목록보기가 가능합니다.')");
	out.println("location.href='login.html'");	
	out.println("</script>");
	return;
}
%>
