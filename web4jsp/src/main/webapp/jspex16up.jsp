<%@page import="pack.controller.SangpumDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String code = request.getParameter("code");
%>

<jsp:useBean id="dbConnPooling" class="pack.controller.DbConnPooling"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
* 상품 수정 *<br>
<%
SangpumDto dto = dbConnPooling.updateDataRead(code);
if(dto == null){
%>
	<script type="text/javascript">
		alert("등록된 상품 코드가 아닙니다.");
		location.href="jspex16dbcp.jsp";
	</script>
<%
	return;
}
%>
<form action="jspex16upok.jsp" method="post">
코드: <%=dto.getCode() %><input type="hidden" name="code" value="<%=dto.getCode() %>"><br>
품명: <input type="text" name="sang" value="<%=dto.getSang() %>"><br>
수량: <input type="text" name="su" value="<%=dto.getSu() %>"><br>
단가: <input type="text" name="dan" value="<%=dto.getDan() %>"><br>
<input type="submit" value="자료 수정">
<input type="button" value="수정 취소" onclick="javascript:location.href='jspex16dbcp.jsp'">

</form>
</body>
</html>