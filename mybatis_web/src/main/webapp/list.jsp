<%@page import="pack.business.SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>* 상품 정보(MyBatis) *</h3>
<a href="ins.html">상품 추가</a>
<br>
<%
ArrayList<SangpumDto> slist = (ArrayList<SangpumDto>)processDao.selectDataAll();
%>
<table border="1">
	<tr>
		<td>코드</td><td>품명</td><td>수량</td><td>단가</td>
	</tr>
	<c:forEach var="s" items="<%=slist%>">
		<tr>
			<td>${s.code}</td>
			<td>${s.sang}</td>
			<td>${s.su}</td>
			<td>${s.dan}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>