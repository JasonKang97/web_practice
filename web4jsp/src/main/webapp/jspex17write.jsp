<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="dto" class="pack.controller.Jspex17Dto"/>
<jsp:setProperty property="*" name="dto"/>
<jsp:useBean id="dbcp" class="pack.controller.Jspex17DBCP"/>

<%
boolean b = dbcp.insertData(dto);

if(b)
	response.sendRedirect("jspex17ex.jsp");	// 추가 성공 후 상품 보기
else
	response.sendRedirect("jspex17fail.html");	// 추가 실패 시 이동


%>
