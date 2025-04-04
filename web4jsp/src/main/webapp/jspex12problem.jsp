<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="formBean" class="pack.controller.Jspex12FormBean"/>
<jsp:setProperty property="*" name="formBean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="Logic" class="pack.controller.Jspex12Logic"/>
<jsp:setProperty property="formBean" name="Logic" value="<%=formBean%>"/>
<jsp:getProperty property="fruit" name="formBean"/>의 구매 가격은 <jsp:getProperty property="cal" name="Logic"/>원
</body>
</html>