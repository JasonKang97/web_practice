<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String data = request.getParameter("data");
String msg = "Mr." + data;
//넘어온 자료로 여러 작업(출력이나 DB 처리 등)을 하다가
// 방법1: redirect 방식으로 다른 jsp 파일 호출
//response.sendRedirect("jspex6jsp2.jsp?mydata=" + msg);

// 방법2: forward 방식으로 다른 jsp 파일 호출
request.setAttribute("mydata",msg);

ArrayList<String> list = new ArrayList<String>();
list.add("홍길동");
list.add("고길동");
list.add("신길동");
request.setAttribute("listdata", list);	// jsp 파일 호출 시 전송자료 하나 더 


/*
RequestDispatcher dispatcher = request.getRequestDispatcher("jspex6jsp2.jsp");
dispatcher.forward(request, response);
*/
// 참고: jsp에서는 좀 더 간단한 방법을 사용 가능. jsp action tag를 사용하면 된다.
%>
<jsp:forward page="jspex6jsp2.jsp"></jsp:forward>
