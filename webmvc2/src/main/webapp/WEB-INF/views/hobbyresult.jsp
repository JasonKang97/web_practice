<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
HobbyController에 의해 호출된 파일
<hr>
<h2>* 취미 선택 결과 *</h2>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:forEach var="h" items="${requestScope.datas}">
${h}<br>
</c:forEach>
</body>
</html>