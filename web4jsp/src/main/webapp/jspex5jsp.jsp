<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
servlet에 의해 호출된 파일이다.<br>
수신 자료: 
<%
// 호출하기1의 경우: redirect
//request.setCharacterEncoding("utf-8");
//String data=request.getParameter("mydata");
//out.println("redirect: " + data);

// 호출하기2의 경우: forward
String data = (String)request.getAttribute("mydata");	// request.getAttribute("mydata");는 object 타입이므로 캐스팅해줌
out.println("forward: " + data);

%>
</body>
</html>