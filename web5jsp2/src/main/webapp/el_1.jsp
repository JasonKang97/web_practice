<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--
EL(Expression Language): JSP의 스크립트의 표현식을 대신해 출력하도록 고안된 언어
<%= %> 대신 $(표현식)으로 처리
 --%>
<h2>EL 사용</h2>
<%
if(request.getParameter("userName") == null){
%>
	<jsp:forward page="el_1.html"/>
<%
}
%>
사용자가 전송한 userName 출력<br>
1-1) JSP scriptlet 사용: <% out.println(request.getParameter("userName")); %><br>
1-2) JSP 표현식 사용: <%= request.getParameter("userName") %><br>
2) EL 사용: ${param.userName}	<%--EL의 내장 객체: param 사용 --%>
</body>
</html>