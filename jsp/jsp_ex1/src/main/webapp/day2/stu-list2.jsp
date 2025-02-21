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

	<%@include file="../db.jsp" %>
	
	<%
		ResultSet rs = null;
	%>
	<table>
		<tr>
			<th>학번</th>
			<th>이름</th>
			<th>학과</th>
			<th>성별</th>
		</tr>
	
	
	<%
		try {
			rs = stmt.executeQuery("SELECT * FROM STUDENT");
			
			while(rs.next()) {
				String stuNo = rs.getString("STU_NO");
	%>
	
			<tr>
				<td><input type="radio" name="select" value="<%= stuNo %>"></td>
				<td>
					<a href="stu-view.jsp?stuNo=<%= stuNo %>"><%= rs.getString("STU_NAME")%></a>
				</td>
				<td><%= rs.getString("STU_DEPT")%></td>
				<td><%= rs.getString("STU_GENDER").equals("M") ?  "남자" : "여자" %></td>
			</tr>
	
	<%			
			}
		} catch(SQLException e) {
			out.println("오류 발생!");
		}
		
	%>
</table>
<button onclick="fnStuRemove()">삭제</button>
</body>
</html>
<script>
	function fnStuRemove() {
		if(!confirm("정말삭제?")) {
			return;
		}
		let select = document.querySelector("input[name='select']:checked");
		location.href="stu-delete.jsp?stuNo="+select.value;
	}
</script>
