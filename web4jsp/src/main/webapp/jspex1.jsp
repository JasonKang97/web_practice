<%@page import="java.util.Date"%>
<%@ page 
language="java" 
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%--	jsp 주석
* JSP Element의 종류
1) 지시어:  <%@  %> 종류: page, include
2) 선언: <%! %> 전역변수 및 메소드 선언
3) 식(표현): <%= %> 클라이언트 값 전송
4) 스크립트릿(scriptlet): <%  %> 자바 코드 작성
5) 액션 태그: <jsp: >
--%>
<h2>JSP 문서 기본 이해</h2>
<%
// 자바 코드 작성 영역
String irum = "한국인";
out.println(irum + "의 홈페이지입니다.");		// 내장객체 out으로 브라우저에 메세지 출력 
for(int i=1;i<7;i++){
	out.print("<h" + i + ">");	// <h1> ...
	out.print("JSP 만세");
	out.println("</h" + i + ">");	// </h1> ...
}
%>
여기는 HTML<br>
<%
Date date = new Date();
out.println(date);
%>
<br>
<i><%= date%></i>	<%--  표현식은 출력할 내용 1개만 사용한다. 뒤에 ;는 사용하지 않는다. --%>
<br>
<%= new Date()%>

<br>여기는 HTML<br>
<%
int a=0, sum=0;
do{
	a++;
	sum +=a;
}while(a<10);
%>
<%= "10까지의 합은 " + sum%>
<br>
<%=irum + "님의 전화번호는 " + tel %>	<%--  기본적으로 jsp는 hoisting기능을 지원하지 않는다. 비슷한 기능은 선언을 통해 사용 가능. --%>
<%!		// 선언: 전역변수가 됨. 이외의 변수 선언은 지역변수. 
		// 왜냐하면 jsp는 HttpServlet을 상속받은 클래스이며 오버라이딩된 service 메소드 내에 코드를 작성한 문서이다.
String tel = "111-1111";
%>
<br>
<%!
public int addMethod(int m, int n){
	return m+n;
}
%>
<%= addMethod(1,2) %>
</body>
</html>