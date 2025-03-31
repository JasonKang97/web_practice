<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.expensive{
		color:red;
		font-weight: bold;
	}
</style>
</head>
<body>
<h2>* 상품 정보 *</h2>
<c:choose>
	<c:when test="${empty products }">
		<p>상품이 존재하지 않습니다.</p>
	</c:when>
	<c:otherwise>
		<table border="1">
			<thead>
				<tr>
					<td>상품명</td><td>가격</td><td>설명</td><td>출시일</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${products}">
					<tr>
						<td>${product.name}</td>
						<td class="<c:if test='${product.price >= 3000}'>expensive</c:if>">
							${product.price}
						</td>
						<td>${product.description}</td>
						<td><fmt:formatDate value="${product.releaseDate}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:otherwise>
</c:choose>
<h2>상품 기타 정보</h2>
<c:set var="totalProducts" value="${fn:length(products)}"/>
<c:set var="totalPrice" value="0"/>
<c:forEach var="pro" items="${products}">
	<c:set var="totalPrice" value="${totalPrice + pro.price}"/>
</c:forEach>

<p>전체 건수: ${totalProducts}</p>
<p>총 금액: ${totalPrice}</p>
<p>평균 가격: <fmt:formatNumber value="${totalPrice/totalProducts}" type="currency"/></p>
<h3>상품 설명</h3>
<ul>
	<c:forEach var="p" items="${products}" varStatus="status">
	<li>${status.count}) <c:out value="${fn:substring(p.description, 0, 10)}..."/></li>
	</c:forEach>
</ul>
</body>
</html>