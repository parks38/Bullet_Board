<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "user.UserDAO" %>
 <%@ page import = "java.io.PrintWriter" %>
  <% request.setCharacterEncoding("UTF-8"); %>

  <jsp:useBean id = "user" class = "user.User" scope = "page" />

  <jsp:setProperty name = "user" property = "userID" /> 
  <jsp:setProperty name = "user" property = "userPassword" /> 
  <!-- login page 과 달리 joinAction page 는 회원에 대한 모든 정보를 받는다.  -->
  <jsp:setProperty name = "user" property = "userName" /> 
  <jsp:setProperty name = "user" property = "userGender" /> 
  <jsp:setProperty name = "user" property = "userEmail" /> 
  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<!--  사용자의 회원가입을 처리하는 페이지   -->
	<%
	String userID = null;
	if(session.getAttribute("userID") != null ){
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

	/*사용자가 정보를 기입하지 않았을 때의 예외처리 */
	if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null ||
			user.getUserEmail() == null || user.getUserGender() == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다. ')");
		script.println("history.back()");
		/* 이전 페이지로 사용자를 돌려보낸다. 로그인 페이지로 돌려보낸다.  */
		script.println("</script>");
	} else {
		/* 회원가입의 모든 항목이 정확이 기입 되었을 경우 
		   로그인된 상태로 페이지를 이용할수 있도록 세팅 
		*/
		UserDAO userDAO = new UserDAO();
		/* login page에서 받은 userID, PW을 받아와 login 함수에 적용하여 실행 */
		int result = userDAO.join(user);
		/* 각각의 변수들을 입력받아서 만들어진 하나의 user 라는 instance가 join 함수를 수행하도록 매개 변수로 들어간다.  */
		if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			/*동일한 아이디를 입력했을때, 이미 데이터베이스에 저장되있는 아이디, 일경우 데이터 오류 */
			script.println("alert('existing userID')");
			script.println("history.back()");
			/* 이미 존재하는 아이디임으로 전페이지로 이동  */
			script.println("</script>");
		} else { /*result != -1인경우는 회원가입이 이루어진 경우 */
			session.setAttribute("userID", user.getUserID());
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			/* 페이지를 메인 페이지로 이동시켜준다  
			   즉, 회원가입이 되었을때는 바로 로그인된 상태로 메인페이지로 보내준다. 
			*/
			script.println("</script>");
		}
	}

	%>
</body>
</html>