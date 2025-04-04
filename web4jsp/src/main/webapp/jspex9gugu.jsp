<%@page import="pack.controller.Jspex9Gugu"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<b>* 현재 내 능력(skill)으로 할 수 있는 방법 *</b>
<br>
<%
int dan = Integer.parseInt(request.getParameter("dan"));
out.println(dan + "단 출력<br>");

//Jspex9Gugu gugu = new Jspex9Gugu();	// 클래스의 포함관계: 객체가 사용자의 요청 수 만큼 계속 생성된다.
Jspex9Gugu gugu = Jspex9Gugu.getInstance();	// 클래스의 포함관계: 싱글톤 패턴 적용


int result[] = gugu.computeGugu(dan);
for(int a=0;a<result.length;a++){
	out.println(dan + "*" + (a+1) + "=" + result[a] + "&nbsp;&nbsp;");
}
%>
<hr>
<b>* beans를 사용 *</b>
<br>
<jsp:useBean id="gugu2" class="pack.controller.Jspex9Gugu"/>	<!-- 해당 class에 대한 객체를 singleton으로 생성 -->
<%
int result2[] = gugu2.computeGugu(dan);
for(int a=0;a<result2.length;a++){
	out.println(dan + "*" + (a+1) + "=" + result2[a] + "&nbsp;&nbsp;");
}
	%>
</body>
</html>