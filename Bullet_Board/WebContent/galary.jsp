<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
				<li><a href="main.jsp">Home</a></li>
				<li class="active"><a href="galary.jsp">갤러리</a></li>
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
	
	<!-- section3 --------------------------------------------- -->
    <section id="section3">
        <div class="container">
            <h1>갤러리</h1>
            <div class="box">
                <div class="image_box">
                    <img src="image/s1.jpg" alt="" onclick="showDivs(1)">
                </div>
                <div class="des">
                    Never let your memories be greater than your dreams.
                </div>
            </div>
            <div class="box">
                <div class="image_box">
                    <img src="image/s2.jpg" alt="" onclick="showDivs(2)">
                </div>
                <div class="des">
                    A mind that is stretched by a new experience can never go back to its old dimension.
                </div>
            </div>
            <div class="box">
                <div class="image_box">
                    <img src="image/s3.jpg" alt="" onclick="showDivs(3)">
                </div>
                <div class="des">
                    Travel makes one modest, you see what a tiny place you occupy in the world.
                </div>
            </div>
            <div class="box">
                <div class="image_box">
                    <img src="image/s4.jpg" alt="" onclick="showDivs(4)">
                </div>
                <div class="des">
                    Life is short and the world is wide.
                </div>
            </div>
        </div>
    </section>
    <div class="clear"></div>
    <!-- //section3 -->
    
    <div id="back"></div>
    <div id="popup">
        <div class="title">Photo Gallery Popup <span class="close" onclick="closePopup()">&times;</span></div>
         <div align-item ="center" class="large">
			<div class="small">
				<img class="mySlides" src="image/s1.jpg">
				<img class="mySlides" src="image/s2.jpg">
				<img class="mySlides" src="image/s3.jpg">
				<img class="mySlides" src="image/s4.jpg">
				
				<a class="leftbtn" onclick="plusDivs(-1)">◀</a>
				<a class="rightbtn" onclick="plusDivs(1)">▶</a>
			</div>
		</div>
    </div>
    
    <!-- footer -->
    <footer>    
        <div class="top">
            <div class="container">
                <span>다운로드</span>
                <span>개인정보처리방침</span>
                <span>저작권지침및신고</span>
                <span>이메일무단수집거부</span>
            </div>
        </div>
        <div class="container">
            <strong>
                Home : Location Log : Tag Log : Media Log : Guestbook : Admin : New Post
            </strong>
            <div class="copyright">
                COPYRIGHT Ⓒ cita's BLOG IS POWERED BY DAUM / DESIGNED BY TISTORY
            </div>
        </div>
    </footer>
    <!-- //footer -->
    
	<script>
		var slideIndex=0;
		function plusDivs(n) {
		  showDivs(slideIndex += n);
		}
		function showDivs(n) {
		  var i;
		  slideIndex = n;
		  var x = document.getElementsByClassName("mySlides");
		  if (n > x.length) {slideIndex = 1}    
		  if (n < 1) {slideIndex = x.length} ;
		  for (i = 0; i < x.length; i++) {
		     x[i].style.display = "none";  
		  }
		  x[slideIndex-1].style.display = "block";  
		  document.getElementById("back").style.display = "block";
		  document.getElementById("popup").style.display = "block"; 
		} 
		
		function closePopup(){
			document.getElementById("back").style.display = "none";
		    document.getElementById("popup").style.display = "none";
		}
	</script>
</body>
</html>