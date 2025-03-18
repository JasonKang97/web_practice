<%@page import="pack.Jspex17Dto"%>
<%@page import="pack.SangpumDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String code = request.getParameter("code");
%>

<jsp:useBean id="dbcp" class="pack.Jspex17DBCP"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
* 상품 수정 *<br>
<%
Jspex17Dto dto = dbcp.updateDataRead(code);
if(dto == null){
%>
	<script type="text/javascript">
		alert("등록된 상품 코드가 아닙니다.");
		location.href="jspex17ex.jsp";
	</script>
<%
	return;
}
%>
<form action="jspex17upok.jsp" method="post">
코드: <%=dto.getCode() %><input type="hidden" name="code" value="<%=dto.getCode() %>"><br>
작성자: <input type="text" name="writer" value="<%=dto.getWriter() %>"><br>
제목: <input type="text" name="title" value="<%=dto.getTitle() %>"><br>
내용: <input type="text" name="contents" value="<%=dto.getContents() %>"><br>
<input type="submit" value="자료 수정">
<input type="button" value="수정 취소" onclick="javascript:location.href='jspex17ex.jsp'">

</form>
</body>
</html>