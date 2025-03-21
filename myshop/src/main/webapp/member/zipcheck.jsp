<%@page import="pack.member.ZipcodeDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberManager" class="pack.member.MemberManager"></jsp:useBean>

<%
request.setCharacterEncoding("utf-8");

String heck = request.getParameter("check");	// y or n
String dongName = request.getParameter("dongName");

ArrayList<ZipcodeDto> zlist = memberManager.zipcodeRead(dongName);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/board.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
window.onload = () => {
	document.querySelector("#btnZipFind").onclick = dongCheck;
	document.querySelector("#btnZipClose").onclick = function(){
		window.close();
	}
}

function dongCheck(){
	alert("a");
}
</script>
</head>
<body>
<strong>* 우편번호 찾기 *</strong>
<form action="zipcheck.jsp" name="zipForm" method="get">
<table>
	<tr>
		<td>
			폼 이름 입력: <input type="text" name="dongName" size="10">
			<input type="button" value="검색" id="btnZipFind">
			<input type="button" value="닫기" id="btnZipClose">
			<input type="hidden" name="check" value="n">a
		</td>
	
	</tr>




</table>
</form>
</body>
</html>