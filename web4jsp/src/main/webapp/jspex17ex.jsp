<%@page import="pack.Jspex17Dto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="dbcp" class="pack.Jspex17DBCP"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
<script type="text/javascript">
let code;
function funcDelete(code){
	if(code !=="" && code !== null){
		if(confirm("정말 삭제하시겠습니까?")){
			location.href="jspex17del.jsp?code=" + code;			
		}
	}
}

function funcUpdate(code){
	if(code !=="" && code !== null){
		location.href="jspex17up.jsp?code=" + code;
	}
}

</script>
</head>
<body>
* 방명록 내용 *
<a href="jspex17write.html">글쓰기</a>

<table border="1">
	<tr>
		<th>코드</th><th>작성자</th><th>제목</th><th>내용</th>
	</tr>
<%
ArrayList<Jspex17Dto> wlist = dbcp.getDataAll();
for(Jspex17Dto w:wlist){
%>
	<tr>
		<td><a href="javascript:funcDelete(<%=w.getCode() %>)"><%=w.getCode() %></a></td>
		<td><a href="javascript:funcUpdate(<%=w.getCode() %>)"><%=w.getWriter() %></a></td>
		<td><%=w.getTitle() %></td>
		<td><%=w.getContents() %></td>
	</tr>
<%
}
%>
</table>
</body>
</html>