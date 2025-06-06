<%@page import="pack.product.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="productManager" class="pack.product.ProductManager"/>

<%
String no = request.getParameter("no");

ProductDto productDto = productManager.getProduct(no);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품보기</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<h2>* 상품 상세보기 *</h2>
<%@include file="admin_top.jsp" %>

<table style="width:90%">
	<tr>
		<td style="width:20%">
		<img src="../upload/<%=productDto.getImage()%>" width="200"/>
		</td>
		<td style="width:50%; vertical-align: top">
			<table style="width:100%">
				<tr>
					<td>번호</td><td><%=productDto.getNo() %></td>
				</tr>
				<tr>
					<td>상품명</td><td><%=productDto.getName() %></td>
				</tr>
				<tr>
					<td>가격</td><td><%=productDto.getPrice() %></td>
				</tr>
				<tr>
					<td>등록일</td><td><%=productDto.getSdate() %></td>
				</tr>
				<tr>
					<td>재고량</td><td><%=productDto.getStock() %></td>
				</tr>
			</table>
		</td>
		<td style="width:30%; vertical-align: top;" >
			<b>* 상품 설명 *</b>
			<%=productDto.getDetail() %>
		</td>
	</tr>
	<tr>
		<td colspan="3">
			<a href="javascript:productUpdate('<%=productDto.getNo() %>')">수정하기</a>
			<a href="javascript:productDelete('<%=productDto.getNo() %>')">삭제하기</a>
		</td>
	</tr>
</table>

<%@include file="admin_bottom.jsp" %>

<!-- productproc로 바로 가는게 아니라 수정 화면을 띄워 정보 수정 후 정보 전달 -->
<form action="productupdate.jsp" name="updateFrm" method="post">	
	<input type="hidden" name="no">
</form>

<form action="productdelete.jsp" name="deleteFrm" method="post">
	<input type="hidden" name="no">
</form>
</body>
</html>