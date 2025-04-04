<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
//String name = request.getParameter("name");	// 지금까지는 이렇게 함. 이제는 빈즈를 사용.
%>
<jsp:useBean id="formBean" class="pack.controller.Jspex11FormBean"/>
<%--
<jsp:setProperty property="name" name="formBean"/>  낱개로 받는다면 이렇게 사용. 
--%>
<jsp:setProperty property="*" name="formBean"/> <%-- 자동으로 모든 값이 setter를 통해 저장됨. --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
Formbean에 저장된 자료 출력<br>
이름은 <jsp:getProperty property="name" name="formBean"/><br>
국어는 <jsp:getProperty property="kor" name="formBean"/><br>
영어는 <jsp:getProperty property="eng" name="formBean"/><br>
<%-- 계산을 위한 클래스를 Beans 사용 --%>
<jsp:useBean id="Logic" class="pack.controller.Jspex11Logic"/>
<jsp:setProperty property="formBean" name="Logic" value="<%=formBean%>"/>
총점은 <jsp:getProperty property="tot" name="Logic"/>
평균은 <jsp:getProperty property="avg" name="Logic"/>
</body>
</html>