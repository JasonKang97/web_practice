<%@page import="pack.Jspex14JikwonDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dbConn" class="pack.Jspex14DbConnClass"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table border="1">
	<tr>
		<td colspan="4">부서명</td>
	</tr>
	<tr>
		<th>사번</th><th>직원명</th><th>직급</th><th>성별</th>
	</tr>
	<%
	String busername = request.getParameter("busername");
	ArrayList<Jspex14JikwonDto> list = dbConn.getDataAll(busername);
	for(Jspex14JikwonDto s:list){
	%>
	<tr>
		<td><%=s.getJikwonno()%></td>
		<td><%=s.getJikwonname()%></td>
		<td><%=s.getJikwonjik()%></td>
		<td><%=s.getJikwongen()%></td>
	</tr>
	<%
	}
	int number = dbConn.number;
	%>
	<tr>
		<td colspan="4">인원수: <%=number %>명</td>
	</tr>
</table>



</body>
</html>