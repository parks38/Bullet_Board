<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import = "java.io.PrintWriter" %>
  <% request.setCharacterEncoding("UTF-8"); %>
 
 <%@ page import = "bbs.BbsDAO" %>
  <jsp:useBean id = "bbs" class = "bbs.Bbs" scope = "page" />
  <jsp:setProperty name = "bbs" property = "bbsTitle" /> 
  <jsp:setProperty name = "bbs" property = "bbsContent" /> 

 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<meta name = "viewport" content = "width=device-width", initial-scale = "1">
<link rel = "stylesheet" href = "css/bootstrap.css">
<title>게시판 웹사이트 </title>
</head>
<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null ){
			userID = (String)session.getAttribute("userID");
		}
		
		//글을 쓰기 위해서는 항상 로그인 상태여야 한다. 
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('Please log in')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		} else {
			//로그인이 되어있는 사람들 
			/* 새로 작성한 글의 title or content invalid then */
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안된 사항이 있습니다. ')");
				script.println("history.back()");
				script.println("</script>");
			}  else { //실제 데이터 베이스에 등록 
				BbsDAO bbsDAO = new BbsDAO();
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				if(result == -1){ //DB Error 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 실패 ')");
					script.println("history.back()");
					script.println("</script>");
				} else { //성공적으로 글쓰기 업로드 -> 게시판으로 이동 
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'bbs.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
	
</body>
</html>