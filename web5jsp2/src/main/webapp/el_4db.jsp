<%@page import="pack.controller.SangpumDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="pack.controller.DbConnClass" scope="page"/>	<%--singleton 타입 객체 생성 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품정보(Beans 사용 - jsp 스크립트로 출력)</h2>
<table border="1">
	<tr>
		<th>코드</th><th>품명</th><th>수량</th><th>단가</th>
	</tr>
	<%
	ArrayList<SangpumDto> list = dbConn.getDataAll();
	for(SangpumDto s:list){
	%>
	<tr>
		<td><%=s.getCode()%></td>
		<td><%=s.getSang()%></td>
		<td><%=s.getSu()%></td>
		<td><%=s.getDan()%></td>
	</tr>
	<%
	}
	%>
</table>

<h2>상품정보(Beans 사용 - JSTL로 출력)</h2>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%ArrayList<SangpumDto> list2 = dbConn.getDataAll();%>
<table border="1">
	<tr>
		<th>코드</th><th>품명</th><th>수량</th><th>단가</th>
	</tr>
	<c:forEach var="s" items="<%=list2 %>">
	<tr>
		<td>${s.code }</td>
		<td>${s.sang }</td>
		<td>${s.su }</td>
		<td>${s.dan }</td>
	</tr>
	
	</c:forEach>
	
</table>
</body>
</html>