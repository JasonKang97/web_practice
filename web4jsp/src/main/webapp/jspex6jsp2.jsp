<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
jsp에 의해 호출된 파일이다.<br>
수신 자료: 
<%
//방법1: redirect 방식으로 다른 jsp 파일 호출
//String data = request.getParameter("mydata");
//out.println("redirect: " + data);

// 방법2: forward 방식으로 다른 jsp 파일 호출
String data = (String)request.getAttribute("mydata");	// request.getAttribute("mydata");는 object 타입이므로 캐스팅해줌
out.println("forward: " + data);
out.println("<br>길동이 출력<br>");
ArrayList<String> list = (ArrayList<String>)request.getAttribute("listdata");
for(String ss:list){
	out.println(ss);
}
%>
</body>
</html>