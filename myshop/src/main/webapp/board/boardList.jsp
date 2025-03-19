<%@page import="pack.board.BoardDto"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="boardManager" class="pack.board.BoardManager"/>
<jsp:useBean id="dto" class="pack.board.BoardDto"/>
<%
int pageSu, bpage=1;	// page는 예약어이므로 bpage라고 선언.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<link rel="stylesheet" type="text/css" href="../css/board.css">

<script type="text/javascript">
window.onload = () => {
	document.querySelector("#btnSearch").onclick = function(){
		if(frm.searchWord.value === ""){
			//frm.searchWord.focus();
			frm.searchWord.placeholder="검색어를 입력하세요";
			return;
		}
		frm.submit();
	}
}

</script>
</head>
<body>
<table border="1">
	<tr>
		<td>
			[<a href="../index.html">메인으로</a>]&nbsp;
			[<a href="boardList.jsp?page=1">최근목록</a>]&nbsp;
			[<a href="boardwrite.jsp">새글작성</a>]&nbsp;
			[<a href="#" onclick="window.open('admin.jsp','width=300,height=200,top=200,left=300')">관리자용</a>]&nbsp;
		<br>
		<br>
		<table style="width:100%">
			<tr style="background-color: cyan;">
				<th>번호</th><th>글제목</th><th>작성자</th><th>등록일</th><th>조회수</th>
			</tr>
			<%
			request.setCharacterEncoding("utf-8");
			try{
				bpage = Integer.parseInt(request.getParameter("page"));
			}catch(Exception e){
				bpage=1;
			}
			if(bpage<=0) bpage=1;
			
			String searchType = request.getParameter("searchType");	// 검색 처리용
			String searchWord = request.getParameter("searchWord");	
			
			boardManager.totalList();	// 전체 레코드 수 구하기
			pageSu = boardManager.getPageSu();	// 전체 페이지 수 얻기
			
			//ArrayList<BoardDto> list = boardManager.getDataAll(bpage);	// 검색이 없는 경우
			ArrayList<BoardDto> list = boardManager.getDataAll(bpage, searchType, searchWord);	// 검색이 있는 경우
			for(int i = 0;i<list.size();i++){
				dto = list.get(i);
			%>
			<tr>
				<td><%=dto.getNum()%></td>
				<td><%=dto.getTitle()%></td>
				<td><%=dto.getName()%></td>
				<td><%=dto.getBdate()%></td>
				<td><%=dto.getReadcnt()%></td>
			</tr>
			<%
			}
			%>
		</table>
			<br>
		<table style="width:100%">
			<tr>
				<td style="text-align:center;">
				<%
				for(int i=1;i<=pageSu;i++){
					if(i == bpage){
						out.print("<b style='font-size:12p'; color:red>[" + i + "]</b>");
					}else{
						out.print("<a href='boardList.jsp?page=" + i + "'>[" + i + "]</a>");
					}
				}
				%>
				<br><br>
				<form action="boardList.jsp" name="frm" method="post">
					<select name="searchType">
						<option value="title" selected="selected">글제목</option>
						<option value="name">작성자</option>
					</select>
					<input type="text" name="searchWord">
					<input type="button" value="검색" name="btnSearch" id="btnSearch">
				</form>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
</body>
</html>