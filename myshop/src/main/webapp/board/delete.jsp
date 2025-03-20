<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");
String bpage = request.getParameter("page");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">
<script type="text/javascript">
let check = () => {
	if(frm.pass.value === ""){
		frm.pass.focus();
		alert("비밀번호를 입력하세요.");
		return;
	}
	if(confirm("정말 삭제하시겠습니까?")){
		frm.submit();
	}
}
</script>
</head>
<body>
<h2>* 글 삭제 *</h2>
<form action="deleteok.jsp" name="frm" method="get">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="page" value="<%=bpage%>">
비밀번호: <input type="password" name="pass">
<input type="button" onclick="check()" value="삭제확인">
<input type="button" onclick="location.href='boardList.jsp?page=<%=bpage %>'" value="목록보기">
</form>
</body>
</html>