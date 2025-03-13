<%--page 지시어: 현재 문서의 속성이나 정보 등을 선언 또는 지시하는 역할 --%>
<%--사용 가능한 언어가 java 하나뿐이라 language="java"는 생략 가능 --%>
<%--session, buffer, autoFlush, isThreadSafe, info 또한 생략 가능 --%>
<%@page import="java.time.ZoneId"%>
<%@ page 
language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"
import="java.time.LocalDate"
import="java.sql.Connection, java.sql.ResultSet"
session="true"
buffer="8kb"
autoFlush="true"
isThreadSafe="true"
info="jsp문서정보 기록"
errorPage="jspex2err.jsp"
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>page 지시어</h2>
현재 날짜: 
<%
LocalDate now = LocalDate.now(ZoneId.of("Asia/Seoul"));
out.println(now.getYear() + "년" + now.getMonthValue() + "월");
%>
<%=now.getDayOfMonth() + "일" %>
<hr>
<%=10/0 %>	<%-- syntax error, runtime error(처음부터 0으로 나눈 경우) 등은 개발자가 수정한다. --%>
<%--하지만 정상적으로 작동하던 페이지가 예상치 못한 에러를 만난 경우는 별도의 화면을 제공해 주는 편이 효과적이다. --%>
</body>
</html>