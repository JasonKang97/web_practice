<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("utf-8");
String id = (String)session.getAttribute("idKey");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js"></script>
<script type="text/javascript">
window.onload = () => {
	document.querySelector("#btnLogin").addEventListener("click", funcLogin);
	document.querySelector("#btnNewMember").addEventListener("click", funcNewMember);
	document.getElementById("btnBack").onclick = () => {
		location.href="../guest/guest_index.jsp";
	}
}
</script>
</head>
<body>
<%
if(id != null){	// 로그인 한 경우
%>
	<b><%=id %>님 환영합니다.</b>
	즐거운 쇼핑되세요!<br>
	<a href="logout.jsp">로그아웃</a>&nbsp;&nbsp;
	<a href="memberlist.jsp">메인으로 돌아가기</a>
<%
}else{	// 로그인 하지 않은 경우
%>
<form name="loginForm">
<table>
	<tr>
		<td colspan="2" style="text-align: center;">* 회원 로그인 *</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><input type="text" name="id"></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><input type="password" name="passwd"></td>
	</tr>
	<tr>
		<td colspan="2">
		<input type="button" value="로 그 인" id="btnLogin">
		<input type="button" value="회원가입" id="btnNewMember">
		<input type="button" value="메인으로 돌아가기" id="btnBack">
		</td>
	</tr>
</table>
</form>
<%	
}
%>
</body>
</html>