<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
<title>페이지 제작</title>
<link rel="stylesheet" href="css/style.css">

</head>
 <body>
<%
	// 로그인이 된 경우 
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
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
					<a href="">멀티미디어</a> 
					<span class="dropmenu"> 
						<span><a href="#">음악듣기</a></span> 
						<span><a href="#">동영상보기</a></span> 
					</span>
				</li>
				<li><a href="#">상품구매</a></li>
				<li><a href="#">찾아오시는길</a></li>
			</ul>
		</div>
	</nav>
	<!-- //nav -->

	<!--  sign-up form  -->
	<div class="container-form">
		<form method="post" action="joinAction.jsp" style="border: 3px solid white">
			<h2>회원 가입 화면</h2>
			<p>회원가입을 위해 폼을 작성해 주세요.</p>
			<hr>
			<div class="block-form">
				<label for="userid"><b>User ID</b> </label> <br>
				 <input
					type="text" placeholder="user ID " name="userID" maxlength="20">
				<br> <label for="userPw"><b>User Password</b> </label> <br>
				<input type="password" placeholder="user password "
					name="userPassword" maxlength="20"> <br> <label
					for="username"><b>User Name</b> </label><br> <input
					type="text" placeholder="user full name " name="userName"
					maxlength="20"> <br>
					
				<label for="gender"><b>Gender</b> </label> <br>	<br>
				<label class="container-checkbox"> 
						<input type="checkbox" name="userGender" autocomplete="off" value="남자" checked>남자 
 						 <span class="checkmark"></span>
 						 </label> 
						
					<label class="container-checkbox" style = "margin-left: 10px;"> 
						 <input type="checkbox" name="userGender" autocomplete="off" value="여자"> 여자
						  <span class="checkmark"></span>
					</label>
			 <br><br>

				<label for="usermail"><b>Email</b> </label> <br> 
				<input
					type="email" placeholder="user email " name="userEmail"
					maxlength="20"> <br> 
				<input type="submit"value="회원 가입">
			</div>

		</form>

	</div>
</body>
</html>