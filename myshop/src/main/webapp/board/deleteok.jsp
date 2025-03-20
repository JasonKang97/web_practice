<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="boardManager" class="pack.board.BoardManager"/>

<%
String num = request.getParameter("num");
String bpage = request.getParameter("page");
String pass = request.getParameter("pass");
// num은 FormBean을 타고 이미 저장됨. setNum();

// 비밀번호 비교 후 수정 여부 결정
boolean b = boardManager.checkPassword(Integer.parseInt(num), pass);	// 비밀번호 비교

if(b){
	boardManager.delData(num);
	response.sendRedirect("boardList.jsp?page="+  bpage);	// 삭제 후 목록보기
}else{
%>
	<script type="text/javascript">
		alert("비밀번호가 일치하지 않습니다.")
		history.back();
	</script>
<%
}
%>

