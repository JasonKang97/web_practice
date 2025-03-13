<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>* 내장 객체 사용 *</h2>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

if(!(id.equals("aa") && pwd.equals("11"))){
	response.sendRedirect("jspex4object.jsp");	// response: http 요청에 대한 응답정보 처리
	// redirect방식은 무조건 문자열만 넘길 수 있으며 url이 바뀐다. forward방식은 모든 객체를 넘길 수 있으며 url이 바뀌지 않는다.
}
%>

입력된 회원 정보 출력<br>
아이디는 <%out.println(id + "<br>"); %>	<%--out: 응답 페이지에 자료 전송을 위한 객체 --%>
<hr>
protocol: <%=request.getProtocol() %><br>
Server buffer size: <%=response.getBufferSize() %><br>

Context path: <%=application.getContextPath() %><br>	<%--application: Application의 Context 정보를 저장하고 있는 객체  --%>
Session: <%=pageContext.getSession() %><%--pageContext: 응답 페이지 실행에 필요한 Context정보를 저장한 객체 --%>









</body>
</html>