<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
.boardBtn {
	background-color: white;
	border: 1px solid #B4B4B4;
	font-size: 18px;
	border-radius: 0%;
	width: 80px;
	height: 40px;
	padding: 0px;
}

#board_ssulBtn {
	background-color: rgb(162, 0, 0);
	color: white;
}

#board_search {
	height: 40px;
	float: left;
	width: 50%;
}

#search {
	margin-top: 10px;
}

#board_searchSel {
	height: 40px;
	width: 80px;
	font-size: 15px;
	align-content: center;
	float: left;
}

#board_ssulBtn {
	float: left;
}

#board_insertBtn {
	float: right;
}

.board-th {
	font-size: 16px;
}

.board-td {
	font-size: 14px;
}

#board_tr:hover {
	background-color: #ededed;
}

.board-td a {
	color: black;
	text-decoration: none;
}

.board-th, .board-td {
	height: 40px;
}

#board_page {
	width: 500px;
	margin: 0 auto;
}

#board_page a {
	color: black;
	text-decoration: none;
	font-size: 15px;
}

@media ( max-width : 993px) {
	.board-th {
		width: 20%;
		font-size: 13px;
	}
	.board-td {
		width: 20%;
		font-size: 13px;
	}
	.board_Tsub {
		width: 25%;
	}
	.board_Tno {
		width: 15%;
	}
	.boardBtn, #board_searchSel {
		width: 50px;
		font-size: 15px;
	}
	#board_page {
		width: 100%;
	}
}
</style>
<script type="text/javascript">
	$(document).ready(
			function() {
				$(".board_modeBtn").on(
						"click",
						function() {
							var id = $(this).attr("id");
							$(this).css("background", "rgb(162,0,0)");
							$(this).css("color", "rgb(255, 255, 255)");
							$('.board_modeBtn').not("#" + id).css("background",
									"rgb(255, 255, 255)");
							$('.board_modeBtn').not("#" + id).css("color",
									"rgb(1, 1, 1)");
						});
			});
</script>
<body>
	<div>
		<!-- 게시판 검색 -->
		<div id="search">
			<select id="board_searchSel">
				<option>글제목</option>
				<option>작성자</option>
			</select> <input type="text" id="board_search" /> <input type="button"
				class="btn boardBtn" value="검색">
		</div>
	</div>
	<div class="row">
		<div style="height: 40px"></div>
		<!-- 게시판 리스트 -->
		<table class="table">
			<tr>
				<th width=10% class="text-center board-th board_Tno">번호</th>
				<th width=40% class="text-center board-th board_Tsub">제목</th>
				<th width=15% class="text-center board-th">이름</th>
				<th width=20% class="text-center board-th">작성일</th>
				<th width=15% class="text-center board-th">조회수</th>
			</tr>
			<c:forEach var="i" begin="1" end="10" step="1">
				<tr id="board_tr">
					<td width=10% class="text-center board-td board_Tno">${i}</td>
					<td width=45% class="text-left board-td board_Tsub"><a
						href="#">어제 무슨 일이 있었냐면요!</a></td>
					<td width=15% class="text-center board-td">민덕인</td>
					<td width=20% class="text-center board-td">2017-12-12</td>
					<td width=10% class="text-center board-td">30</td>
				</tr>
			</c:forEach>
		</table>
		
		<!-- 버튼, 페이지 -->
		<div>
			<div>
				<input type="button" class="btn boardBtn" value="글쓰기"
					id="board_insertBtn">
			</div>
			<div style="height: 40px"></div>
			<div id="board_page">
				<center>
					<a href="#"><</a>&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="10">
						<a href="#">${i }</a>&nbsp;
							</c:forEach>
					&nbsp;&nbsp;&nbsp;<a href="#">></a>
				</center>
			</div>
		</div>
	</div>
</body>
</html>