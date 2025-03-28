<%@page import="pack.product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productManager" class="pack.product.ProductManager"/>
<%
ProductDto dto = productManager.getProduct(request.getParameter("no"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 수정</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<%@include file="admin_top.jsp" %>

<form action="/myshop/product/update" method="post" enctype="multipart/form-data">
<table style="width:90%">
	<tr>
		<th colspan="2"><h2>* 상품 추가 *</h2></th>
	</tr>
	<tr>
		<td>상품명</td>
		<td><input type="text" name="name" value="<%=dto.getName()%>"></td>
	</tr>
	<tr>
		<td>상품가격</td>
		<td><input type="text" name="price" value="<%=dto.getPrice()%>"></td>
	</tr>
	<tr>
		<td>설 명</td>
		<td><textarea rows="5" style="width:98%" name="detail"><%=dto.getDetail()%></textarea></td>
	</tr>
	<tr>
		<td>재고량</td>
		<td><input type="text" name="stock" value="<%=dto.getStock()%>"></td>
	</tr>
	<tr>
		<td>사 진</td>
		<td>
			<img src="../upload/<%=dto.getImage()%>" style="width: 20%">
			<input type="file" name="image" size="30" accept="image/*">
			<input type="hidden" name="currentImage" value="<%=dto.getImage()%>">
		</td>
	</tr>
	<tr>
		<td colspan="2" style="text-align: center">
		<br>
		<input type="hidden" name="no" value="<%=dto.getNo()%>">
		<input type="submit" value="상품 수정">
		<input type="reset" value="입력 초기화">
		<input type="button" value="수정 취소" onclick="history.back()" >
		</td>
	</tr>
</table>
</form>

<%@include file="admin_bottom.jsp" %>
</body>
</html>