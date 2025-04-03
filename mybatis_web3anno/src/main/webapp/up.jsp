<%@page import="pack.business.DataDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>

<%
String id = request.getParameter("id");
DataDto dto = processDao.selectMember(id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>* 회원 정보 수정 *</h2>
	<form action="upok.jsp" method="post"><br>
	i d: <%=dto.getId()%><br>
	<input type="hidden" name="id" value="<%=dto.getId()%>">
	name: <input type="text" name="name" value="<%=dto.getName()%>"><br>
	pwd: <input type="text" name="passwd"><br>
	<br>
	<input type="submit" value="수정">
</form>
</body>
</html>