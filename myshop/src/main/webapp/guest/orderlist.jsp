<%@page import="pack.product.ProductDto"%>
<%@page import="pack.order.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="orderManager" class="pack.order.OrderManager"/>
<jsp:useBean id="productManager" class="pack.product.ProductManager"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 목록</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../js/script.js"></script>
</head>
<body>
<h2>* 주문 상품 목록 *</h2>
<%@include file="guest_top.jsp" %>
<table style="width:90%">
	<tr style="background-color: gray;">
		<th>주문번호</th><th>상품명</th><th>주문수량</th><th>주문일자</th><th>주문상태</th>
	</tr>
	<% 
	String id = (String)session.getAttribute("idKey");
	ArrayList<OrderBean> list = orderManager.getOrder(id);
	
	if(list.isEmpty()){
		%>
		<tr>
			<td colspan="5">주문한 상품이 없습니다.</td>
		</tr>
		<% 
	}else{
		for(OrderBean order:list){
			ProductDto product = productManager.getProduct(order.getProduct_no());
		%>
		<tr style="text-align: center">
			<td><%= order.getNo()%></td>
			<td><%= product.getName()%></td>
			<td><%= order.getQuantity()%></td>
			<td><%= order.getSdate()%></td>
			<td>
				<!--<%= order.getState()%> -->
				<%
				switch(order.getState()){
				case "1": out.print("접수"); break;
				case "2": out.print("입금확인"); break;
				case "3": out.print("배송준비"); break;
				case "4": out.print("배송중"); break;
				case "5": out.print("처리완료"); break;
				default: out.print("접수중");
				}
				%>
			</td>
		</tr>
		<%
		}
	}

	
	%>
</table>
<%@include file="guest_bottom.jsp" %>

</body>
</html>