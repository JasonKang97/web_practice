<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="jspex3top.jsp" %> <%--해당 파일의 소스 코드가 이 자리로 불러들여옴 --%>
<h1>파일 포함(include) 연습</h1>
<pre>
여
기
는

본문이야
</pre>

<%-- 파일 포함을 위한 jsp action tag 현습 --%>
jsp action tag의 대상은 jsp, servlet, html 모두 가능<br>
<jsp:include page="jspex3action1.jsp"/> <%--jsp:include는 소스 코드 실행 결과를 이 자리에 표시 --%>
<br>
<jsp:include page="jspex3action2.jsp">
	<jsp:param value="korea" name="msg"/>
</jsp:include>


<%@ include file="jspex3bottom.jsp" %>

</body>
</html>