<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- css, js 연결하기 -->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css" />
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<style>
.bg {
	background-image: url('image/bg.jpg');
	background-size: 100% 100%;
}

#logo {
	width: 20%;
}

#bg_black {
	background: #111;
	opacity: 0.3;
}

.container_fluid {
	height: 100%;
	width: 100%;
	position: absolute;
}

#content {
	padding-top: 20%;
}

#enterBtn {
	background-image: url('image/enterBtn.png');
	background-size: 100% 100%;
	width: 20%;
	height: 80px;
	margin-top: 20px;
	cursor: pointer;
	opacity: 0.8;
}
#enterBtn p{
	font-size: 35px;
	color: white;
	line-height: 80px;
}

#enterBtn:hover {
	opacity: 1;
}

#intro {
	margin-top: 10px;
}

#intro span {
	text-decoration: none;
	color: white;
	font-size: 16px;
	cursor: pointer;
}


.modal-body span{
	font-size: 18px;
	color: white;
}
.modal-content{
	background-color: #262626;
}
#myModalLabel{
	color: white;
}

/* 미디어쿼리 */
@media ( max-width : 992px) {
	#logo {
		width: 198px;
	}
	.bg {
		background-img: url('image/bg.jpg');
		background-size: inherit;
	}
	#content {
		padding-top: 40%;
	}
	#enterBtn {
		width: 198px;
		height: 60px;
	}
	#enterBtn p{
		font-size: 25px;
		color: white;
		line-height: 60px;
	}
	.modal-body span{
		font-size: 14px;
	}
	.modal-body img{
		width: 60px;
	}
	 #myModalLabel {
	 	font-size: 18px;
	 }
}


</style>

<script type="text/javascript">
	$(function() {
		$('#intro span').click(function() {
			$('#myModal').modal("show");
			// 모달창 열기
		});
	});
</script>

<body>
	<div class="container_fluid bg" id="bg"></div>
	<div class="container_fluid bg" id="bg_black"></div>
	<div class="container_fluid">
		<div id="content">
			<center>
				<div>
					<img id="logo" src="image/logo.png">
				</div>
				<div id="enterBtn" data-toggle="modal" data-target="#loginModal">
					<p>입장하기</p>
				</div>
				<div id="login" data-toggle="modal" data-target="#loginModal"> <img id="btn_enter" /></div>
				<!-- 09-->
            	<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"
            	data-backdrop="static" data-keyboard="false">
               		<div class="modal-dialog">
                  		<div class="modal-content">
                     		<div class="modal-header">
                        		<button type="button" class="close" data-dismiss="modal">
                           		<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
                        		</button>
                        		<h3 class="modal-title" id="myModalLabel">로그인</h3>
                     		</div>
                     		<div class="modal-body">
                        		<jsp:include page="member/login.jsp"/>
                     		</div>
                 		</div>
               		</div>
            	</div>
            	
            	<div id="intro">
					<span>끼리끼리 소개</span>
				</div>
				<!-- 모달 팝업 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal">
									<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
								</button>
								<h3 class="modal-title" id="myModalLabel">끼리끼리 소개</h3>
							
							</div>
							<div class="modal-body">
								<img src="image/couple.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/add.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/beer.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/equal.png">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="image/heart.png"> <br><br><br>
								<span>
								핫플레이스를 공유하고 핫하게 놀자!<br>
								홍대 이태원 강남 <br>
								어디서 놀아야할지 모르겠다고요?<br>
								끼리끼리 렛츠끼릿에서 리드하겠습니다<br>
								일단 입장하세요
								</span>
							</div>
						</div>
					</div>
				</div>
			</center>
		</div>
	</div>
</body>
</html>