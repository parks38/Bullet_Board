<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
    <title>페이지 제작</title>
    <link rel="stylesheet" href="css/bootstrap.css">
    <style>

    </style>
</head>
 <body>
<%
	// 로그인이 된 경우 
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
%>
    
	<!-- 게시판 글쓰기 화면  -->
	<div class = "container" style = "margin-top: 10%;">
		<div class = "row">
			<!-- post : 보내지는 내용이 숨겨지도록 만들어진다. -->
			<!-- 사용자가 작성한내용은 writeAction.jsp 로 보내지며  -->
			<form method = "post" action = "writeAction.jsp">
				<table class = "table table-striped" style = "text-align: center; border: 1px solid #dddddd">
					<thead> <!--테이블의 속성을 알려준다 -->
						<tr> <!-- 행: 한줄 -->
							<!-- colspan : 2개 만큼의 열을 잡아먹도록  -->
							<th colspan = "2" style = "background-color: #eeeeee; text-align : center;"> 게시판 글쓰기 양식 </th>
						
						</tr>
					</thead>
					
					<tbody>
						<tr> <!-- 각각 한줄씩 들어갈수 있도록 타이틀과 컨텐트를 <tr>로 각자 감싼다  -->
							<td><input type = "text" class = "form-control" placeholder = "Title" name = "bbsTitle" maxlength = "50"></td>
						</tr>
						<tr> 
							<td><textarea class = "form-control" placeholder = "Content" name = "bbsContent" maxlength = "2048" style="height:350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- submit : data를 action page로 보내기   -->
				<input type = "submit" class = "btn btn-primary pull-right" value = "글쓰기">
			 </form>
		</div>
	</div>
</body>
</html>