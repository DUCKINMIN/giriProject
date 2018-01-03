<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYZZIM</title>
<style type="text/css">
	.myboard{
		width: 100%;
		height: 350px;
	}
	@media all and (max-width:770px) {
		.myboard{
			font-size: 10px;
		}
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#myboard").css({
			"color": "white", "background-color": "#262626"
		});
	});
</script>
</head>
<body>
	<!-- 찜목록 -->
	<div>
		<h4><img alt="like" src="member/image/m_zzim.png" width="25px">&nbsp;찜 목록</h4>
	</div>
	<div class="myboard">
		<table class="table" style="clear: both;">
			<tr>
				<th width="15%" class="text-center">번호</th>
				<th width="45%" class="text-left">제목</th>
				<th width="20%" class="text-center">조회수</th>
				<th width="20%" class="text-center">영업시간</th>
			</tr>
			<c:forEach var="vo" items="${list }">
			<tr>
				<td width="15%" class="text-center">${vo.cartvo.cb_no }</td>
				<td width="45%" class="text-left"><a href="cb_detail.do?cb_no=${vo.cartvo.cb_no }">${vo.clubbarvo.cb_name }</a></td>
				<td width="20%" class="text-center">${vo.clubbarvo.cb_hit }</td>
				<td width="20%" class="text-center">${vo.clubbarvo.cb_open }</td>
			</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td class="text-center" colspan="4">
        			<a href="mypage.do?zzimPage=${curpage>1?curpage-1:curpage }">&lt;</a>&emsp;
               		<c:forEach var="i" begin="1" end="${totalpage<1?1:totalpage }">
                  		&nbsp;<a href="mypage.do?zzimPage=${i}">${i }</a>
               		</c:forEach>&emsp;
               		<a href="mypage.do?zzimPage=${curpage<totalpage?curpage+1:curpage }">&gt;</a>
               	</td>
            <tr>
		</table>
	</div>
	
	<!-- 작성글 -->
	<div>
		<h4><img alt="board" src="member/image/m_table.png" width="25px">&nbsp;작성 글</h4>
	</div>
	<div class="myboard">
		<table class="table">
			<tr>
				<th width="15%" class="text-center">번호</th>
				<th width="55%" class="text-left">제목</th>
				<th width="20%" class="text-center">조회수</th>
				<th width="10%" class="text-center">작성일</th>
			</tr>
			<c:forEach var="bvo" items="${blist }">
			<tr>
				<td width="15%" class="text-center">${bvo.b_no }</td>
				<td width="55%" class="text-left"><a href="board_content.do?no=${bvo.b_no }&grade=${bvo.b_grade}">${bvo.b_subject }</a></td>
				<td width="20%" class="text-center">${bvo.b_hit }</td>
				<td width="10%" class="text-center"><fmt:formatDate value="${bvo.b_regdate }" pattern="yyyy.MM.dd"/></td>
			</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td class="text-center" colspan="4">
        			<a href="mypage.do?boardPage=${bcurpage>1?bcurpage-1:bcurpage }">&lt;</a>&emsp;
               		<c:forEach var="i" begin="1" end="${btotalpage<1?1:btotalpage }">
                  		&nbsp;<a href="mypage.do?boardPage=${i}">${i }</a>
               		</c:forEach>&emsp;
               		<a href="mypage.do?boardPage=${bcurpage<btotalpage?bcurpage+1:bcurpage }">&gt;</a>
               	</td>
            <tr>
		</table>
	</div>	
	
	<!-- 작성댓글  -->
	<div>
		<h4><img alt="comment" src="member/image/comment.png" width="25px">&nbsp;작성 댓글</h4>
	</div>
	<div class="myboard">
		<table class="table">
			<tr>
				<th width="15%" class="text-center">번호</th>
				<th width="55%" class="text-left">댓글</th>
				<th width="20%" class="text-center"></th>
				<th width="10%" class="text-center">작성일</th>
			</tr>
			<c:forEach var="cvo" items="${clist }">
			<tr>
				<td width="15%" class="text-center">${cvo.bc_no }</td>
				<td width="55%" class="text-left">${cvo.bc_content }</td>
				<td width="20%" class="text-center"><input type="hidden" value="${cvo.b_no }">원본보기</td>
				<td width="10%" class="text-center"><fmt:formatDate value="${cvo.bc_regdate }" pattern="yyyy.MM.dd"/></td>
			</tr>
			</c:forEach>
		</table>	
		<table class="table">
			<tr>
				<td class="text-center" colspan="4">
        			<a href="mypage.do?commentPage=${ccurpage>1?ccurpage-1:ccurpage }">&lt;</a>&emsp;
               		<c:forEach var="i" begin="1" end="${ctotalpage<1?1:ctotalpage }">
                  		&nbsp;<a href="mypage.do?commentPage=${i}">${i }</a>
               		</c:forEach>&emsp;
               		<a href="mypage.do?commentPage=${ccurpage<ctotalpage?ccurpage+1:ccurpage }">&gt;</a>
               	</td>
            <tr>
		</table>
	</div>	
</body>
</html>