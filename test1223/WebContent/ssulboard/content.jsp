<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
	#board_pro{
		background-image: url('../image/pro.png');
		background-size: 100%;
		border-radius: 50%;
		width: 80px;
		height: 80px;
		float:left;
	}
	#board_user{
		width: 200px;
		height: 80px;
		margin-left: 100px;
		padding-top: 8px;
	}
	#board_user p{
		margin: 0;
	}
	#board_name{
		font-size: 18px;
		font-weight: bold;
		padding-bottom: 5px;
	}
	#board_subject{
		height: 40px;
		border-bottom: 2px solid #bbb;
	}
	#board_subject p{
		/* line-height: 40px; */
		font-size: 17px;
		font-weight: bold;
	}
	#board_content p{
		font-size: 17px;
	}
	#board_cotentBtn{
		margin-top: 30px;
		height: 40px;
		width:100%;
		text-align: right;
	}
	.board_cotentBtn{
		/* float:right; */
		width: 50px;
		font-size: 15px;
	}
</style>
<body>
<!-- 게시판 상세보기 -->
	<div class="content_wrap">
		<div style="height: 20px"></div>
		<div id="board_pro"></div>
		<div id="board_user">
			<p id="board_name">배주현</p>
			<p id="board_regdate">2017-12-13</p>
			<p id="board_hit">조회수 50</p>
		</div>
		<div style="height: 30px"></div>
		<!-- 게시판 상세보기  제목 -->
		<div id="board_subject">
			<p>저는 집에 가고 싶어요~</p>
		</div>
		<div style="height: 20px"></div>
		<!-- 게시판 상세보기 내용 -->
		<div id="board_content">
			<p>저는 오늘 칼퇴를 할 것이에요<br>
			여러분들 생각은 어때요?<br>
			좋아요?<br>
			저도 좋아요~~~~<br>
			</p>
		</div>
		<!-- 게시판 상세보기 버튼 -->
		<div id="board_cotentBtn">
			<input id="board_updateBtn" class="btn board_btn board_cotentBtn" type="button" value="수정">
			<input class="btn board_btn board_cotentBtn" type="button" value="삭제">
			<input class="btn board_btn board_cotentBtn" type="button" value="목록">
		</div>
	</div>
	<!-- 리뷰 -->
	<div class="container review_wrap">
		<jsp:include page="../ssulboard/review.jsp"></jsp:include>
	</div>
</body>
</html>