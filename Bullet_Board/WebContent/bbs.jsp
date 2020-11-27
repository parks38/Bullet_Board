<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>
    <%@ page import="bbs.BbsDAO" %>
    <%@ page import="bbs.Bbs" %>
    <%@ page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
    <title>페이지 제작</title>
    <link rel="stylesheet" href="css/style.css">
    <style>
    	 .contianertable table{
			  border-collapse: collapse;
			  width: 60%;
			  left: 20%;
			  top: 180px;
			  position: absolute;
			  padding: 10px;
		}
		
		.contianertable .button {
			  top: 87%;
			  position: absolute;
			  float: right;
			  right: 23%;	
			  background-color: #00bd39;
			  color: white;
			  padding: 10px 20px 10px 20px;
			  border-radius: 7px;	
		}
		
		.contianertable table th, td{
			padding : 17px;
		}
  
    </style>
</head>
 <body>
<%
	// 로그인이 된 경우 
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	
	int pageNumber = 1;
	if(request.getParameter("pageNumber") != null) {
		// parameter은 정수형으로 바꿔주어야함 
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}

%>
     <!-- header -->
    <header>
        <div class="container">
            <div class="logo">
                <img style = "width : 100px; height: 100px;" src="image/mouse.png">
            </div>
            <%
            	//로그인 되어있지 않을 경우
            	if(userID == null) {
            %>
            <ul class="sidemenu">
               <li><a href="#">Site map</a></li>
               <li><a href="sign-up.jsp">회원가입</a></li>
			   <li><a href="login.jsp">로그인</a></li>
            </ul>
            <%
            	} else {
            %>
             <ul class="sidemenu">
               <li><a href="#">Site map</a></li>
               <li><a href=""> <%= userID %> 님 </a></li>
			   <li><a href="logout.jsp">로그아웃</a></li>
            </ul>           
            
            <%
            	}
            %>
        </div>
    </header>
    <!-- //header -->
    
<!-- nav --------------------------------------------- -->
	<nav>
		<div class="container">
			<ul class="leftMenu">
				<li class="active"><a href="main.jsp">Home</a></li>
				<li><a href="galary.jsp">갤러리</a></li>
				<li class="dropBox">
					<a href="bbs.jsp">게시판</a> 
					<span class="dropmenu"> 
						<span><a href="#">자유 게시판</a></span> 
						<span><a href="#">문의 게시판</a></span> 
						<span><a href="#">건의 게시판</a></span>
					</span>
				</li>
				<li class="dropBox">
					<a href="music.jsp">멀티미디어</a> 
					<span class="dropmenu"> 
						<span><a href="music.jsp">음악듣기</a></span> 
						<span><a href="video.jsp">동영상보기</a></span> 
					</span>
				</li>
				<li><a href="#">상품구매</a></li>
				<li><a href="#">찾아오시는길</a></li>
			</ul>
		</div>
	</nav>
	<!-- //nav -->
    
    <!-- container  -->
    <div class = "contianertable">
		<table style = "text-align: center; border: 1px solid #dddddd">
			<thead> <!--테이블의 속성을 알려준다 -->
				<tr> <!-- 행: 한줄 -->
					<th style = "background-color: #eeeeee; text-align : center;"> 번호 </th>
					<th style = "background-color: #eeeeee; text-align : center;"> 제목  </th>
					<th style = "background-color: #eeeeee; text-align : center;"> 작성자  </th>
					<th style = "background-color: #eeeeee; text-align : center;"> 작성일  </th>
				</tr>
			</thead>
				<tbody>
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = bbsDAO.getList(pageNumber); //현재의 페이지에서 가져온 목록을 불러온다 
						for(int i = 0; i < list.size(); i++) {
					%>
					<tr> <!-- 계시글 출력  현재의 index 의 정보 -->
							<td><%=list.get(i).getBbsID()%></td>
						<!--  현재의 글의 view page 를 링크로 걸어둔다.  -->
							<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>"><%=list.get(i).getBbsTitle()%>
							</a></td>
							<td><%=list.get(i).getUserID()%></td>
						<!-- date format 변경  -->
						<td> <%= list.get(i).getBbsDate().substring(0,11) + list.get(i).getBbsDate().substring(11,13)
								+ "시" + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
		</table>
			
			<!-- 글을 쓸수있는 페이지로 옮겨가기  -->
	<a href = "write.jsp" class = "button"> 글쓰기 </a>
    </div>
</body>
</html>