<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품 정보(MVC 패턴 사용)</h3>
<table border="1">
	<thead>
		<tr>
			<td>코드</td><td>품명</td><td>수량</td><td>단가</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="s" items="${datas}">
		<tr>
			<td>${s.code}</td><td>${s.sang}</td><td>${s.su}</td><td>${s.dan}</td>
		</tr>
		</c:forEach>	
	</tbody>
</table>
</body>
</html>