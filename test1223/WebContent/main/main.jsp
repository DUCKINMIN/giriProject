<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=JejuGothic"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/bootstrap.css"/>
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">
* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	text-decoration: none;
}

.header {
	background: #262626;
	/* height: 80px; */
}

#nav li a strong {
	font-size: 18px;
	color: #fff;
}

.nav_main:hover {
	border-bottom: 5px solid rgb(162, 0, 0);
}

#user_img {
	border-radius: 50%;
	margin-right: 7px;
}

#navbar-main {
	line-height: 100px;
	margin-right: 15px;
}

#logo_img {
	width: 180px;
	padding: 20px;
}

.dropdown-menu {
	-webkit-box-shadow: none;
	box-shadow: none;
	border: none;
}

#dropdown_sub h5 {
	font-size: 15px;
	color: #fff;
}

#dropdown_sub {
	border: none;
}

#dropdown_sub:hover {
	background: #262626;
}

.navbar-inverse 

.navbar-inverse .navbar-nav>.open>a:focus, .navbar-inverse .navbar-nav>.open>a:hover
	{
	background: #262626;
}
/* .navbar-inverse .navbar-nav > .open > a:focus {
	color:#9d9d9d;
} */
#footer {
	background: #303030;
	width: 100%;
	height: 120px;
	position: absolute;
	left: 0;
	bottom: 0;
	padding-top: 40px;
	color: rgb(170, 170, 170);
	margin: 0px auto;
}

#footer span {
	font-size: 13px;
}

html, body {
	height: 100%;
}

.main_wrap {
	position: relative;
	min-height: 100%;
	padding-bottom: 120px;
	margin: 0px auto;
	width:100%;
}
#footer_1, #footer_2, #footer_3, #footer_4 {
	display:inline;
	margin: 0px auto;
}

@media (max-width: 460px) {
  #footer {
  	height:160px;
  }
  #footer_5 {
  	padding-bottom: 10px;
  }
  .main_wrap {
  	padding-bottom:160px;
  }
}
</style>

</head>
<body>
<div class="main_wrap">
	<nav class="navbar navbar-inverse navbar-fixed-top header">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a href="login_ok.do" class="" style="color: white"> <img
				id="logo_img" src="image/logo1.png">
			</a>
		</div>
		<div class="navbar-collapse collapse">
			<ul class="nav navbar-nav" id="nav">
				<li class="nav_main"><a href="main.jsp?mode=1"><strong>HOT3</strong></a></li>
				<li class="nav_main"><a href="main.jsp?mode=2"><strong>이벤트</strong></a></li>
				<li class="dropdown nav_main"><a href="#"
					class="dropdown-toggle" data-toggle="dropdown"><strong>커뮤니티<b
							class="caret"></b></strong> </a>
					<ul class="dropdown-menu">
						<li><a id="dropdown_sub" href="board_list.do"><h5>썰전</h5></a></li>
						<li><a id="dropdown_sub" href="board_list.do?grade=1"><h5>고민상담</h5></a></li>
					</ul></li>
			</ul>
			<!--< ul class="nav navbar-nav navbar-right">
				<li><a href="#">로그인</a></li>
			</ul> -->
			<c:if test="${sessionScope.id==null }">
				<!-- 로그인X -->
				<!-- 입장하기로 보내기 -->
			</c:if>
			<c:if test="${sessionScope.id==null }">
				<!-- 유저 -->
				<div class="navbar-right" id="navbar-main">
					<div class="">
						<img src="image/man.png" id="user_img" /> <font color="white">USER</font>
					</div>
				</div>
			</c:if>
		</div>
	</div>
	</nav>
	<div style="height: 102px"></div>

		<div class="include_wrap">
		<jsp:include page="${main_jsp}"></jsp:include>
		
		<div id="footer" class="text-center">
			<div id="footer_1">
				<strong>COMPANY&nbsp;&nbsp;&nbsp;</strong> <span>레츠끼릿컴퍼니</span>
				&nbsp;&nbsp;&nbsp;&nbsp; 
			</div>
			<div id="footer_2">
				<strong>OWNER&nbsp;&nbsp;&nbsp;</strong> <span>김다솜 문예슬 송창석 조명연 권영규 민덕인</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<div id="footer_3"> 
				<strong>TEL&nbsp;&nbsp;&nbsp;</strong> <span>02-1234-1234</span> 
			 	&nbsp;&nbsp;&nbsp;&nbsp; 
			</div>
			<div id="footer_4"> 
				<strong>E-MAIL&nbsp;&nbsp;&nbsp;</strong> <span>lets@getit.com</span>
				&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
			<br> <br>
			<div id="footer_5"> 
				<strong>ADDRESS&nbsp;&nbsp;&nbsp;</strong> <span>서울특별시 서대문구
				북아현동 125-44 4층</span>
			</div>

		</div>

</div>
</div>

</body>
</html>