<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../db.jsp" %>
	<%
		String stuNo = request.getParameter("stuNo");
		
		String query = "DELETE FROM STUDENT WHERE STU_NO = "+ "'" + stuNo + "'";
		
		try {
			int result = stmt.executeUpdate(query);
			if(result > 0) {
				out.println("삭제 되었습니다.");
			} else {
				out.println("실패");
			}
			
		} catch(SQLException e) {
			out.println(e.getMessage());
		}
	%>
</body>
</html>