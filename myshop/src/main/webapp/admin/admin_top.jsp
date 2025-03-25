<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String adminId = (String)session.getAttribute("adminKey");

if(adminId == null){
	response.sendRedirect("adminlogin.jsp");
}
%>

<table style="width:90%">
	<tr style="background-color:#ffbbcc; text-align=center;">
		<th><a href="../guest/guest_index.jsp">홈페이지</a></th>
		<th><a href="adminlogout.jsp">로그아웃</a></th>
		<th><a href="membermanager.jsp">회원관리</a></th>
		<th><a href="productmanager.jsp">상품관리</a></th>
		<th><a href="ordermanager.jsp">주문관리</a></th>
		<th><a href="../board/boardList.jsp">게시판(Q&A)</a></th>
	</tr>
</table>