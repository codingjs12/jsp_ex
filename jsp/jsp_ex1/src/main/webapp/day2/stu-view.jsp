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
	
	a {
		text-decoration: none;
		color : blue;
	}
</style>
</head>
<body>
<%@include file="../db.jsp"%>
<form action="stu-update.jsp" name="update">
	<%
	
		// 학번, 이름, 학과, 학년, 점수
		String stuNo = request.getParameter("stuNo");
	
		String query = 	
			"SELECT S.STU_NO, STU_NAME, STU_DEPT, STU_GRADE, ENR_GRADE "
				+ "FROM STUDENT S "
				+ "INNER JOIN ENROL E ON S.STU_NO = E.STU_NO "
				+ "WHERE S.STU_NO = "
				+ "'" + stuNo + "'";
		ResultSet rs = stmt.executeQuery(query);
		
		if(rs.next()) {
			%>
			<div>학번 : <%=rs.getString("STU_NO") %></div>
			<div>이름 : <%=rs.getString("STU_NAME") %></div>
			<div>학과 : <%=rs.getString("STU_DEPT") %></div>
			<div>학년 : <%=rs.getString("STU_GRADE") %></div>
			<div>시험점수 : <%=rs.getString("ENR_GRADE") %></div>
			
			<%
			
// 			out.println(rs.getString("STU_NO"));
// 			out.println(rs.getString("STU_NAME"));
// 			out.println(rs.getString("STU_DEPT"));
// 			out.println(rs.getString("STU_GRADE"));
// 			out.println(rs.getString("ENR_GRADE"));

		} else {	
			out.println("조회 실패!");
		}
	%>
	
	<input name="stuNo" value="<%= stuNo %>" hidden>
	<div>
		<input type="submit" value="수정">
	</div>
	
</form>
</body>
</html>

