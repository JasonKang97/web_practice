<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="logincheck.jsp" %>
<h2>* 사용자 목록 *</h2>
<a href="insert.html">사용자 추가</a>
<table border="1">
	<tr>
		<th>아이디</th><th>이름</th><th>이메일</th>
	</tr>
	<c:forEach var="u" items="${list}">
	<tr>
		<th>${u.userid}</th><th>${u.name}</th><th>${u.email}</th>
	</tr>
	</c:forEach>
</table>
<br>
<a href="logout.m2">로그아웃</a>
</body>
</html>