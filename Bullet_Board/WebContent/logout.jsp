<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<title> JSP 게시판 웹 사이</title>
</head>
<body>
	<%
		session.invalidate();
		// 현재 이 페이지에 접속한 회원에게는 부여한 session을 빼앗아서 log out 
	%>
	<script>
		location.href = 'main.jsp';
	</script>
	
</body>
</html>