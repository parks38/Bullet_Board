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
	
	<!-- section2 --------------------------------------------- -->
    <section id="section2">
        <div class="container">
            <div class="loginBox">
                <div>
                    <div class="box">
                        <div class="logo">
                            <h1>로그인</h1>
                        </div>
                        <form action = "loginAction.jsp" method="post">
                            <input type="text" name="userID" placeholder="아이디">
                            <input type="password" name="userPassword" placeholder="비밀번호">
                            <button type="submit">로그인</button>
                        </form>
                    </div>
                    <div class="box">
                        <div class="social logo">
                            <h1>소셜 로그인하기</h1>
                            <button class="facebook">페이스북 ID로 로그인</button>
                            <button class="twitter">트윗터 ID로 로그인</button>
                            <button class="naver">네이버 ID로 로그인</button>
                        </div>
                    </div>
                    <div class="clear"></div>
                    <div class="alert">
                        <h1>도움이 필요하신가요?</h1>
                        <p>
                            <button>아이디 찾기</button>
                            <button>비밀번호 찾기</button>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <div class="clear"></div>
    <!-- //section -->
    
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
                COPYRIGHT Ⓒ  Cita's BLOG IS POWERED BY DAUM / DESIGNED BY TISTORY
            </div>
        </div>
    </footer>
    <!-- //footer -->
</body>
</html>