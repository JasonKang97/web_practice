<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%request.setCharacterEncoding("utf-8"); %>

<jsp:useBean id="bean" class="pack.member.MemberBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="memberManager" class="pack.member.MemberManager"/>

<%
boolean b = memberManager.memberUpdate(bean, bean.getId());

if(b){
%>
<script type="text/javascript">
	alert("수정 성공");
	location.href="membermanager.jsp";
</script>
<%
}else{
%>
<script type="text/javascript">
	alert("수정 실패\n관리자에게 문의 바람");
	history.back();
</script>	
<%
}
%>
