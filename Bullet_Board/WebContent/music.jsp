<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html;" charset="UTF-8">
	<script src = "//code.jquery.com/jquery-latest.min.js"></script>
	
    <title>페이지 제작</title>
    <link rel="stylesheet" href="css/style.css">
<script src="https://kit.fontawesome.com/a076d05399.js"></script>

    
	<style>
	
	.player {
	position: absolute;
	top: 500px;
	left: 570px;
	float: left;
	transform: translate(-50%,-50%);
	width: 320px;
	height: 480px;
	overflow: hidden;
}
.player .main {
	width: 100%;
	height: 100%;
	background: #121212;
	transition:all 500ms ease-in-out;
		border-radius : 10px;
	
}
.player .main .thumbnail img {
	margin: 5%;
	width: 90%; 
	height: 230px;
	
}
.player .main .seekbar {
	margin-top: 15px;
	width : 230px;
}
.player .main .seekbar input[type="range"] {
	-webkit-appearance:none;
	width: 100%;
	height: 4px;
	outline: none;
	background: #aaa;
	overflow: hidden;
}
.player .main .seekbar input[type="range"]::-webkit-slider-thumb {
	-webkit-appearance:none;
	width: 0px;
	height: 0px;
	box-shadow: -300px 0px 0px 300px #00acee;
}
.player .main .details {
	text-align: center;
	padding: 15px 0px;
}
.player .main .details h2 {
	font-size: 18px;
	color:#eee;
	margin-bottom: 5px;
}
.player .main .details p {
	font-size: 15px;
	color: #aaa;
}
.music {
	margin-left : 20%;
}
.music button {
	background-color : black;
	color : white;
	border : 1px solid white;
	padding: 5px 8px 5px 8px;
	font-size: 25px;
	margin-right : 10px; 
	border-radius : 5px;

}

 section .music-list table {
   border-radius: 10px;
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 650px;
  float: left;
  left: 800px;
	top: 380px;
	position: absolute;
  
}

section .music-list td, th {
  border: 1px solid #dddddd;
  text-align: center;
  padding: 8px;
  color: white;
}

section {
	margin-left: 250px;
	margin-top: 50px;
	width: 1300px;
	border-radius : 15px;
	background-color: #292929;
	
	
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
				<li><a href="main.jsp">Home</a></li>
				<li><a href="galary.jsp">갤러리</a></li>
				<li class="dropBox">
					<a href="bbs.jsp">게시판</a> 
					<span class="dropmenu"> 
						<span><a href="#">자유 게시판</a></span> 
						<span><a href="#">문의 게시판</a></span> 
						<span><a href="#">건의 게시판</a></span>
					</span>
				</li>
				<li class="dropBox active">
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
	
	<!--  music player 부분  -->
	<section class = "playerContainer">
				<div class="player">
					<div class="main">
						<div class="thumbnail">
							<img src="image/music.jpg">
						</div>
			
						<div class="details">
							<h2> 칵테일의 사랑 </h2>
							<p>마카로니에 </p>
						</div>
						<!-- 
						<audio controls style = "margin-left : 10px;">
							  <source style= "background-color:rgb(255,0,0);opacity:0.6;" src="image/music.mp3" type="audio/jpg">
							  
						</audio>
						-->
						
			
						<audio id="player" src="image/music.mp3"></audio>
						<div class = "music"> 
						  <button onclick="document.getElementById('player').play()"><i class="fa fa-play"></i></button> 
						  <button onclick="document.getElementById('player').pause()"> <i class="fa fa-pause"></i></button> 
						  <button onclick="document.getElementById('player').volume -= 0.1"><i class="fas fa-volume-down"></i></button> 
						  <button onclick="document.getElementById('player').volume += 0.1"><i class="fas fa-volume-up"></i></button> 
						</div>
			
					</div>
				</div>
		
			<!-- list of music -->
				<div class = "music-list">
						<table>
							  <tr>
							    <th>노래 </th>
							    <th>가수 </th>
							    <th>시간 </th>
							  </tr>
							  <tr>
							    <td>칵테일의 사랑 </td>
							    <td>마카로니에 </td>
							    <td>3:48 </td>
							  </tr>
							  <tr>
							    <td> 애국가 </td>
							    <td> 미상 </td>
							    <td>4:20</td>
							  </tr>
							  <tr>
							    <td> Dance the Night Away </td>
							    <td>Twice </td>
							    <td>3:12</td>
							  </tr>
							  <tr>
							    <td>Palette </td>
							    <td> 아이유 </td>
							    <td> 3:39 </td>
							  </tr>
							  <tr>
							    <td>All I Want for Christmas Is You</td>
							    <td>Mariah Carey</td>
							    <td>3:55</td>
							  </tr>
							  <tr>
							    <td>Dynamite</td>
							    <td>BTS</td>
							    <td>3:26</td>
							  </tr>
							</table>
					</div>
	</section>


</body>
</html>