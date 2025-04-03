<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<jsp:useBean id="bean" class="pack.business.DataFormBean"/>
<jsp:setProperty property="*" name="bean"/>
<jsp:useBean id="processDao" class="pack.business.ProcessDao"/>

<%
boolean b = processDao.updateMember(bean);
%>

<script>
<% 
if(b) { 
%>
    alert("업데이트 성공!");
    window.location.href = "list.jsp";
<%
}else { 
%>
    alert("업데이트 실패!");
    window.location.href = "list.jsp";
<% 
} 
%>
</script>