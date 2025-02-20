<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>zzzzzzzzzzzzz</div>
	
	<jsp:forward page="forward-view.jsp">
		<jsp:param value="hong123" name="userId"/>
		<jsp:param value="30" name="userAge"/>
	</jsp:forward>
</body>
</html>