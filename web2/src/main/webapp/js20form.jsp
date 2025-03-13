<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 자바 영역(자바 개발자)
request.setCharacterEncoding("utf-8");
String irum = request.getParameter("name");
String id = request.getParameter("id");
String email = request.getParameter("email");
System.out.println("자바 표준 출력장치: " + irum + " " + id + " " + email); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
console.log(`자바 스크립트 표준출력장치(JS 개발자): <%=irum%>`)
</script>
</head>
<body>
일반 사용자
이름은 <%=irum %><br>
아이디는 <%=id %> 이메일은 <%=email %>
</body>
</html>