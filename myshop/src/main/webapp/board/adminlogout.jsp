<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
session.removeAttribute("adminOk");	// 세션 삭제로 로그아웃
%>
<br><br>
<a href="javascript:window.close()">창닫기</a>
</body>
</html>