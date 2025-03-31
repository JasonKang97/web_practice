<%@page import="pack.Student"%>
<%@page import="pack.Person"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
전통적인 방법: <%=request.getAttribute("irum") %><br>
EL: ${requestScope.irum} ${irum}<br>

전통적인 방법: <%Person p = (Person)request.getAttribute("person"); 
out.println(p.getName());%><br>
EL: ${person.name }<br>

전통적인 방법: <%Student s = (Student)request.getAttribute("student"); 
out.println(s.getAge());%><br>
EL: ${student.age}<br>
<hr>
동물의 종류: ${animal[0]}, ${animal["1"]}, ${animal['2']}<br>
<c:if test="${list!=null }">
	<c:forEach var="a" items="${list}">
		${a[0]}, ${a[1]}, ${a[2]}
	</c:forEach>
</c:if>
<br>
<c:if test="${list!=null }">
	<c:forEach var="a" items="${list}">
		<c:forEach var="b" items="${a}">
			${b}
		</c:forEach>
	</c:forEach>
</c:if>
<br>
<c:choose>
	<c:when test="${list eq null}">list 자료 없음</c:when>
	<c:otherwise>list 자료 있음</c:otherwise>
</c:choose>
<hr>
예외 처리: try ~ catch 블럭을 JSTL에서는 catch ~ if를 사용한다.<br>
<c:catch var="myErr">
<%int a = 10/0; out.println(a);%>
</c:catch>
<c:if test="${myErr!=null}">
	에러 발생: ${myErr.message}
</c:if>
<br>
다른 문서 포함<br>
include 지시어 사용: <%@include file="poham.jsp"%>
jsp action tag 사용: <jsp:include page="poham.jsp"/>
jstl 사용: <c:import url="poham.jsp"/>
<br>
<c:import url="https://www.kbs.co.kr"/>
</body>
</html>