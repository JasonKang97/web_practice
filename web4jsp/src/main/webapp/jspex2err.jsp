<%--isErrorPage="true"는 해당 JSP 페이지가 에러 페이지로 사용됨을 나타낸다 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isErrorPage="true"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
에러 발생 <%= exception.getMessage() %>
</body>
</html>