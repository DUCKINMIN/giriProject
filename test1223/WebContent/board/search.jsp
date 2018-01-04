<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	$(function() {
		var strSearch = $('#strSearch').val();
		$(".apage").click(function() {
			var aid = $(this).attr("id");

			$('#'+aid+'Frm').submit(); //데이터 전송
		});
		if(strSearch==""){		
			$('.row').html('<div style="height: 40px"></div><div align="center"'+
					' style="margin-bottom:40px"><h2>"${strSearch }" 에 대한 검색결과가 없습니다</h2>'+
					'</div></div>'
			);
			$('#board_page').html("");
		}
	});

</script>
</head>
<style>
form {
	display: inline;
 }
.boardBtn {
	background-color: white;
	border: 1px solid #B4B4B4;
	font-size: 18px;
	border-radius: 0%;
	width: 80px;
	height: 40px;
	padding: 0px;
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

<body>
	<div>
		<!-- 게시판 검색 -->
		<div id="search"><form id="searchFrm" method="POST" action="board_search.do">
			<select id="board_searchSel" name="select">
				<option value="b_subject">글제목</option>
				<option value="m_nick">작성자</option>
			</select> 
			<input type="text" id="board_search" name="strSearch"/>
			<input type="submit" class="btn boardBtn" value="검색">
			<input type="hidden" name="grade" value="${grade }">
			
			</form>
		</div>
		
	</div>
	<div class="row">
		<div style="height: 40px"></div>
		<div align="center" style="margin-bottom:40px">
				<h2>"${strSearch }" 검색결과</h2>
		</div>
		<!-- 게시판 리스트 -->
		<div style="height:440px">
		<table class="table">
			<tr>
				<th width=10% class="text-center board-th board_Tno">번호</th>
				<th width=40% class="text-center board-th board_Tsub">제목</th>
				<th width=15% class="text-center board-th">이름</th>
				<th width=20% class="text-center board-th">작성일</th>
				<th width=15% class="text-center board-th">조회수</th>
			</tr>
			<c:forEach var="vo" items="${list }">
				<tr id="board_tr">
					<td width=10% class="text-center board-td board_Tno">${vo.b_no }</td>
					<td width=45% class="text-left board-td board_Tsub"><a
						href="board_content.do?no=${vo.b_no }&grade=${vo.b_grade}">${vo.b_subject }</a></td>
					<td width=15% class="text-center board-td">${vo.m_nick }</td>
					<td width=20% class="text-center board-td"><fmt:formatDate
							value="${vo.b_regdate }" pattern="yyyy-MM-dd" /></td>
					<td width=10% class="text-center board-td">${vo.b_hit }</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		</div>
		<!-- 버튼, 페이지 -->
		<div style="margin-top:10px">
			<div style="height: 40px"></div>
			<div id="board_page">
				<center>
					<form id="preFrm" action="board_search.do" method="POST">
					<a id="pre" class="apage"><</a>&nbsp;&nbsp;&nbsp;
					<input type="hidden" value="${curpage>1?curpage-1:curpage }" name="page">
					<input type="hidden" value="${grade}" name="grade">
					<input type="hidden" value="${select }" name="select">
					<input type="hidden" value="${strSearch }" name="strSearch">
					</form>
					<c:forEach var="i" begin="1" end="${totalpage<1?1:totalpage }">
						<form id="iFrm" action="board_search.do" method="POST">
							<a id="i" class="apage">${i }</a>&nbsp;
							<input type="hidden" value="${i }" name="page">
							<input type="hidden" value="${grade}" name="grade">
							<input type="hidden" value="${select }" name="select">
							<input type="hidden" value="${strSearch }" name="strSearch">
						</form>
					</c:forEach>
					&nbsp;&nbsp;&nbsp;
					<form id="nextFrm" action="board_search.do" method="POST">
					<a id="next" class="apage">></a>
						<input type="hidden" value="${curpage<totalpage?curpage+1:curpage }" name="page">
						<input type="hidden" value="${grade}" name="grade">
						<input type="hidden" value="${select }" name="select">
						<input type="hidden" value="${strSearch }" name="strSearch" id="strSearch">
					</form>
				</center>
			</div>
		</div>
	
</body>
</html>