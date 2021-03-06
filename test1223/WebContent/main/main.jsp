<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>

<style type="text/css">
* {
	box-sizing: border-box;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	text-decoration: none;
}

a:link {
	text-decoration: none;
}

a {
	color: black;
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
	margin-top: 10px;
	margin-right: 5px;
}

#navbar-user {
	margin-right: 10px;
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
	margin-top: 50px;
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
	width: 100%;
}

#footer_1, #footer_2, #footer_3, #footer_4 {
	display: inline;
	margin: 0px auto;
}

@media screen and (min-width: 769px) {
	#user_img {
		width: 80px;
		height: 80px;
	}
}

@media screen and (max-width: 770px) {
	#user_img {
		width: 50px;
		height: 50px;
	}
	#navbar-main {
		margin-top: 10px;
	}
	
	#username{
		display: none;
	}
}

@media ( max-width : 460px) {
	#footer {
		height: 160px;
	}
	#footer_5 {
		padding-bottom: 10px;
	}
	.main_wrap {
		padding-bottom: 160px;
	}
}
</style>
<script type="text/javascript">
$(function(){
	$("#logout").click(function(){
		var answer = confirm ("�α׾ƿ� �Ͻðڽ��ϱ�?");
		if (answer) {
			location="logout.do";
		} else {
			return;
		}
	});
});
</script>
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
				<a href="main.do" class="" style="color: white"> <img
					id="logo_img" src="image/logo1.png">
				</a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav" id="nav">
					<li class="nav_main"><a href="hot3.do"><strong>HOT3</strong></a></li>
					<li class="nav_main"><a href="event.do"><strong>�̺�Ʈ</strong></a></li>
					<li class="dropdown nav_main"><a href="#"
						class="dropdown-toggle" data-toggle="dropdown"><strong>Ŀ�´�Ƽ<b
								class="caret"></b></strong> </a>
						<ul class="dropdown-menu">
							<li><a id="dropdown_sub" href="board_list.do"><h5>����</h5></a></li>
							<li><a id="dropdown_sub" href="board_list.do?grade=1"><h5>���λ��</h5></a></li>
						</ul></li>
				</ul>
				<!-- 09 -->
				<c:if test="${sessionScope.m_email==null }">
					<!-- �̷α��ν� -->
					<div class="navbar-right" id="navbar-main">
						<a href="mypage.do">
							<div>
								<img src="image/man.png" id="user_img" /> <font color="white">USER</font>
							</div>
						</a>
					</div>
				</c:if>
				<c:if test="${sessionScope.m_email!=null }">
					<!-- �α��ν� -->
					<div class="navbar-right" id="navbar-user">
						<div style="margin-top: 20px" id="username">
							<a href="mypage.do"><font color="white">${sessionScope.m_nick }</font></a>
						</div>
						<div style="margin-top: 25px">
							<a href="#" id="logout"><font color="white">�α׾ƿ�</font></a>
						</div>
					</div>
					<div class="navbar-right" id="navbar-main">
						<a href="mypage.do"> <img
							src="member/profile/${sessionScope.m_profile }" id="user_img">
						</a>
					</div>
				</c:if>
			</div>
		</div>
		</nav>
		<div style="height: 102px"></div>
		<div class="include_wrap">
			<jsp:include page="${main_jsp}"></jsp:include>
			<div style="height: 102px"></div>
			<div id="footer" class="text-center">
				<div id="footer_1">
					<strong>COMPANY&nbsp;&nbsp;&nbsp;</strong> <span>�����������۴�</span>
					&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
				<div id="footer_2">
					<strong>OWNER&nbsp;&nbsp;&nbsp;</strong> <span>��ټ� ������ ��â��
						������ �ǿ��� �δ���</span> &nbsp;&nbsp;&nbsp;&nbsp;
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
					<strong>ADDRESS&nbsp;&nbsp;&nbsp;</strong> <span>����Ư���� ���빮��
						�Ͼ����� 125-44 4��</span>
				</div>
			</div>
		</div>
	</div>

</body>
</html>