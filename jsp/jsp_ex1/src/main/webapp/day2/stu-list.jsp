<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table, tr, th, td {
		border : 1px solid black;
		border-collapse : collapse;
		padding : 10px;
		text-align : center;
	}
	
	
</style>
</head>
<body>

	<%@include file="../db.jsp" %>
	
	<%
		ResultSet rs = null;
		try {
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			out.println("<table>");
			out.println("<tr>");
			out.println("<th>이름</th>");
			out.println("<th>학번</th>");
			out.println("<th>학과</th>");
			out.println("<th>성별</th>");
			out.println("</tr>");
			
			while(rs.next()) {
			out.println("<tr>");
			out.println("<td>");
			out.println(rs.getString("STU_NAME"));
			out.println("</td>");

			out.println("<td>");
			out.println(rs.getString("STU_NO"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("STU_DEPT"));
			out.println("</td>");
			out.println("<td>");
			out.println(rs.getString("STU_GENDER").equals("M") ? "남자" : "여자" );
			out.println("</td>");
			out.println("</tr>");
			}
			
			out.println("</table>");
			
		} catch(SQLException e) {
			out.println("오류 발생!");
		}
		
	%>

</body>
</html>