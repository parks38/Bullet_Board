<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "user.UserDAO" %>
 <%@ page import = "java.io.PrintWriter" %>
 <jsp:useBean id = "user" class = "user.User" scope = "page" />
 <jsp:setProperty name = "user" property = "userID" />
 <jsp:setProperty name = "user" property = "userPassword" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 사용자의 로그인을 처리하는 페이지  -->
	<!-- USERDAO 를 이용해서 작업을 처리하겠다. -->
	
	<%	
		String userID = null;
		if(session.getAttribute("userID") != null ){
			//세션을 확인해서 userID라는 session이 있는 경우에는 
			// userID에 해당 session값을 넣어준다. 
			userID = (String) session.getAttribute("userID");
			//userID라는 변수
		}
		
		//이미 로그인이 되어있는 사람은 또다시 로그인을 할 수 없도록 막아준다. 
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('already logged in')");
			script.println("location.href = 'main.jsp'");
			/* 로그인이 이미 되어있음으로 main.jsp 페이지로 이동할수 있도록 설정 */
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		/* login page에서 받은 userID, PW을 받아와 login 함수에 적용하여 실행 */
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		if(result == 1){
			//로그인에 성공했을때 세션을 부여해 준다 - session값은 userID로 
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			/* 로그인에 성공했을 때 main.jsp 페이지로 이동할수 있도록 설정 */
			script.println("</script>");
		} else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong password')");
			/* 비밀번호가 틀렸을때 alert  */
			script.println("history.back()");
			/* 이전 페이지로 사용자를 돌려보낸다. 로그인 페이지로 돌려보낸다.  */
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong user ID')");
			/* userID 틀렸을때 alert  */
			script.println("history.back()");
			/* 이전 페이지로 사용자를 돌려보낸다. 로그인 페이지로 돌려보낸다.  */
			script.println("</script>");
		} else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Database Error')");
			script.println("history.back()");
			/* 이전 페이지로 사용자를 돌려보낸다. 로그인 페이지로 돌려보낸다.  */
			script.println("</script>");
		}
	%>
</body>
</html>