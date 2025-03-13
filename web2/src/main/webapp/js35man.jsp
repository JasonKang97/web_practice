<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
{"jikwon":
[
<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String result = "";
try{
	Class.forName("org.mariadb.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/test", "root", "123");
}catch(Exception e){
	System.out.println("연결 오류:" + e.getMessage());
	return;
}
try{
	pstmt = conn.prepareStatement("select jikwonno, jikwonname, jikwonjik, DATE_FORMAT(jikwonibsail, '%Y') from jikwon where jikwongen='남' order by jikwonno asc");
	rs = pstmt.executeQuery();
	while(rs.next()){
		result += "{";
		result += "\"jikwonno\":" + "\"" + rs.getString("jikwonno") + "\",";
		result += "\"jikwonname\":" + "\"" + rs.getString("jikwonname") + "\",";
		result += "\"jikwonjik\":" + "\"" + rs.getString("jikwonjik") + "\",";
		result += "\"jikwonibsail\":" + "\"" + rs.getString("DATE_FORMAT(jikwonibsail, '%Y')") + "\"";
		result += "},";
	}
	if(result.length() > 0){
		result = result.substring(0, result.length() - 1);
	}
	out.print(result);
}catch(Exception e){
	System.out.println("처리 오류:" + e.getMessage());
}
%>
]
}