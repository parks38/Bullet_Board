<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.PrintWriter" %>

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
	
	<!-- main section page -->
	<div class = "containerSlide">
		<img class = "mySlides" src = "image/main1.jpg">
		<img class = "mySlides" src = "image/main2.jpg">
		<img class = "mySlides" src = "image/main3.jpg">
		<img class = "mySlides" src = "image/main4.jpg">
		<button class = "prev" onclick = "plusDivs(-1)"> &#10094; </button>
		<button class = "next" onclick = "plusDivs(+1)"> &#10095; </button>
	</div>
	
	<script>
		var slideIndex = 1;
		showDivs(slideIndex);
		
		function plusDivs(n) {
			showDivs(slideIndex += n);
		}
		
		function showDivs(n) {
			var i;
			var x = document.getElementsByClassName("mySlides");
			if(n > x.length) {
				slideIndex = 1;
			}
			if(n < 1){
				slideIndex = x.length;
			}
			for(i = 0;  i < x.length; i++){
				x[i].style.display = "none";
			}
			x[slideIndex-1].style.display = "block";
		}
	</script>

  
</body>
</html>