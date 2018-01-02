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
		border: 1px solid skyblue;
		width: 100%;
		height: 290px;
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
				<th width="55%" class="text-left">제목</th>
				<th width="20%" class="text-center">조회수</th>
				<th width="10%" class="text-center">작성일</th>
			</tr>
			<c:forEach var="i" begin="1" end="5">
			<tr>
				<td width="15%" class="text-center">${i }</td>
				<td width="55%" class="text-left">제목ㅇ${i }</td>
				<td width="20%" class="text-center">100</td>
				<td width="10%" class="text-center">2010.01.31</td>
			</tr>
			</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td class="text-center" colspan="4">
       				<a href="#">&lt;</a>&emsp;
       				<c:forEach var="i" begin="1" end="10">
       					&nbsp;<a href="#">${i }</a>&nbsp;
      				</c:forEach>&emsp;
       				<a href="#">&gt;</a>
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
			<c:forEach var="vo" items="${list }">
			<tr>
				<td width="15%" class="text-center">${vo.bvo.b_no }</td>
				<td width="55%" class="text-left">${vo.bvo.b_subject }</td>
				<td width="20%" class="text-center">${vo.bvo.b_hit }</td>
				<td width="10%" class="text-center"><fmt:formatDate value="${vo.bvo.b_regdate }" pattern="yyyy.MM.dd"/></td>
			</tr>
			</c:forEach>
		</table>	
		<table class="table">
			<tr>
				<td class="text-center" colspan="4">
        			<a href="mypage.do?page=${curpage>1?curpage-1:curpage }">&lt;</a>&emsp;
               		<c:forEach var="i" begin="1" end="${totalpage<1?1:totalpage }">
                  		&nbsp;<a href="mypage.do?page=${i}">${i }</a>
               		</c:forEach>&emsp;
               		<a href="mypage.do?page=${curpage<totalpage?curpage+1:curpage }">&gt;</a>
               	</td>
            <tr>
		</table>
	</div>	
	
	<!-- 작성댓글 -->
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
			<c:forEach var="i" begin="1" end="5">
			<tr>
				<td width="15%" class="text-center">${i }</td>
				<td width="55%" class="text-left">제목${i }</td>
				<td width="20%" class="text-center">원문보기</td>
				<td width="10%" class="text-center">2010.01.31</td>
			</tr>
			</c:forEach>
		</table>	
		<table class="table">
			<tr>
				<td class="text-center" colspan="4">
        			<a href="#">&lt;</a>&emsp;
               		<c:forEach var="i" begin="1" end="10">
                  		&nbsp;<a href="#">${i }</a>&nbsp;
               		</c:forEach>&emsp;
               		<a href="#">&gt;</a>
               	</td>
            <tr>
		</table>
	</div>	
</body>
</html>