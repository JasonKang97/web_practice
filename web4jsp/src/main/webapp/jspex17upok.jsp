<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
%>

<jsp:useBean id="dto" class="pack.Jspex17Dto"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dbcp" class="pack.Jspex17DBCP"/>

<%
//boolean b = dbConnPooling.updateData(formBean);

if(dbcp.updateData(dto))
	response.sendRedirect("jspex17ex.jsp"); // 수정 후 목록보기
else
	response.sendRedirect("jspex17fail.html");	// 수정 실패시 이동 페이지
%>
