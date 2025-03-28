<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
JSTL(Java Standard Tag Library): 변수, 제어문 사용이 가능. 일반적으로 EL과 함께 사용.<hr>
* 변수 처리 *<br>
<c:set var="irum" value="공기밥" scope="page"/>	<%-- page, request, session, application --%>
이름1: <c:out value="${irum }"/><br>

<c:set var="ir" scope="session">
주먹밥
</c:set>
이름2: <c:out value="${ir }"/><br>
<c:remove var="irum" scope="session"/>	<%-- scope="..."의 영역이 같아야 한다. --%>
이름1: <c:out value="${irum }"/><br>
<c:remove var="irum" scope="request"/>
이름1: <c:out value="${irum }"/><br>
<c:remove var="irum" scope="page"/>
이름1: <c:out value="${irum }"/><br>
<br>
<c:set var="abc" value="${header['User-Agent'] }"></c:set>
현재 사용중인 브라우저 정보: <c:out value="${abc}"></c:out>
<br>
<c:set var="su1" value="10"/>
<c:set var="su2" value="20"/>
합은 ${su1 + su2}
<hr>
* 조건 판단문 if *<br>
<c:set var="nice" value="star"/>
<c:if test="${nice == 'star' }">	<%--nice == 'star' 또는 nice eq 'star' 사용 가능. 조건이 거짓이면 출력되지 않음 --%>
	if 연습: nice값은 <c:out value="${nice}"/>
</c:if>
<c:if test="${nice != 'star' }">	<%-- else 역할 --%>
	if 연습: 조건이 참이 아닌 경우 출력. else는 존재하지 않음.
</c:if>
<br><br>
* 조건 판단문 choose(switch와 비슷함) *<br>
<c:choose>
	<c:when test="${nice == 'moon'}">
		달 <c:out value="${nice }"/>
	</c:when>
	<c:when test="${nice == 'star'}">
		별 <c:out value="${nice }"/>
	</c:when>
	<c:otherwise>어떠한 조건도 만족하지 않는 경우 수행</c:otherwise>
</c:choose>
<br><br>
* 반복문 forEach *<br>
연습1: 
<c:forEach var="i" begin="1" end="10" step="2">	<%-- step이 1일 경우 생략 가능 --%>
	${i}
</c:forEach>
<br><br>
연습 1-1) 구구단 3단 출력<br>
<c:forEach var="i" begin="1" end="9">
	3*${i}=${3*i}<br>
</c:forEach>

<br><br>
연습2(header 내장객체 값 출력)<br>
<c:forEach var="h" items="${headerValues}">
	속성: ${h.key}<br>
	값:
	<c:forEach var="a" items="${h.value }">
	${a}$nbsp;
	</c:forEach>
</c:forEach>
<br><br>
<%
HashMap<String, Object> map = new HashMap<>();
map.put("name", "손오공");
map.put("today", new Date());
%>
<c:set var="m" value="<%=map%>"/>
<c:forEach var="kk" items="${m}">	<%--컬랙션(배열, 리스트, 맵 등) items를 이용 --%>
	${kk.key}: ${kk.value}<br>
</c:forEach>
<br>
List 컬렉션 자료 반복 출력
<%
List<String> names = new ArrayList<>();
names.add("유비");
names.add("관우");
names.add("장비");
request.setAttribute("names", names);
%>
<c:forEach var="n" items="${names}">
이름: ${n}&nbsp;&nbsp;&nbsp;
</c:forEach>
<br>
<br>
배열 생성 후 출력<br>
<c:set var="arr" value="<%=new int[]{1,2,3,4,5} %>"/>
<c:forEach var="j" items="${arr}" begin="2" end="4" step="2">
	${j}
</c:forEach>
<br><br>
* 문자열 분항 후 출력 *<br>
<c:forTokens var="animal" items="horse,dog,cat,tiger,lion" delims=",">
동물: ${animal}&nbsp;&nbsp;&nbsp;
</c:forTokens>
<br>

<c:forTokens var="city" items="서울,인천,수원,원주*춘천,제주" delims=",*" varStatus="num">
(${num.count})(${num.index})${city}&nbsp;&nbsp;&nbsp;	<!-- index는 0부터, count는 1부터 시작 -->
</c:forTokens>

<hr>
* 숫자 및 날짜 서식 *<br>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
숫자: <fmt:formatNumber value="12345.678" type="number"/><br>	<!-- 서식을 줄 수 있다. -->
숫자: <fmt:formatNumber value="12345.678" type="currency"/><br>
숫자: <fmt:formatNumber value="12345.678" type="percent"/><br>
숫자: <fmt:formatNumber value="1.678" pattern="0,000.0"/><br>	<!-- 0은 유효한 숫자가 없을 경우 0으로 채우고, #은 유효한 숫자가 없을 경우 찍지 않는다 -->
숫자: <fmt:formatNumber value="1.678" pattern="#,##0.0"/><br>
숫자: <fmt:formatNumber value="0" pattern="0,000.0"/><br>
숫자: <fmt:formatNumber value="0" pattern="#,##0.0"/><br>
숫자: <fmt:formatNumber value="0" pattern="#,###.#"/><br>
<br><br>
<c:set var="now" value="<%=new Date()%>"/>
<c:out value="${now}"/><br>
날짜: <fmt:formatDate value="${now}" type="date"/><br>
시간: <fmt:formatDate value="${now}" type="time"/><br>
날짜 및 시간: <fmt:formatDate value="${now}" type="both"/><br>
날짜 및 시간: <fmt:formatDate value="${now}" type="both" pattern="yyyy년 MM월 dd일 hh시 MM분 ss초"/><br>



</body>
</html>