<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String code = request.getParameter("code");
%>

<jsp:useBean id="dbcp" class="pack.Jspex17DBCP"/>


<%
if(dbcp.deleteData(code))
	response.sendRedirect("jspex17ex.jsp"); // 삭제 후 목록보기
else
	response.sendRedirect("jspex17fail.html");	// 삭제 실패시 이동 페이지
%>
