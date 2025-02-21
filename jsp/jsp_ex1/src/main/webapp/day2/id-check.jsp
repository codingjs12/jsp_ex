
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
<%@include file="../db.jsp"%>
	<form name="check">
	<%
		String stuNo = request.getParameter("stuNo");
		
		ResultSet rs = stmt.executeQuery(
				"SELECT * FROM STUDENT WHERE STU_NO = '" + stuNo + "'");
		if(rs.next()) {
			out.println("이미 사용중인 학번입니다.");
	%>
		<input name="flg" value="Y" hidden>
	
	<%
		} else {
			out.println("사용가능한 학번입니다.");
	%>
		<input name="flg" value="N" hidden>
	<%
		}
	%>
	<div>
		<input type="button" value="되돌아가기" onclick="fnBack()">
	</div>
	</form>
</body>
</html>
<script>
	function fnBack() {
		window.opener.getReturn(document.check.flg.value);
	}

	
</script>

