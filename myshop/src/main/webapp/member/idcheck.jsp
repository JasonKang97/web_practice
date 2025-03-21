<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="memberManager" class="pack.member.MemberManager"></jsp:useBean>
<%
request.setCharacterEncoding("utf-8");
String id = request.getParameter("id"); 
boolean b = memberManager.idCheckProcess(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/style.css" rel="stylesheet" type="text/css">
<script src="../js/script.js">


</script>
</head>
<body style="text-align: center; margin-top: 30px;">
<h2><%=id%></h2>
<%
if(b){
%>
	이미 사용중인 ID입니다. 다른 ID를 사용해주세요.<br>
	<a href="#" onclick="opener.regForm.id.focus();window.close()">닫기</a>
<%
}else{
%>
	사용 가능한 ID입니다.<br>
	<a href="#" onclick="opener.regForm.passwd.focus();window.close()">닫기</a>
<%	
}

%>
</body>
</html>