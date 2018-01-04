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
	<div class="myboard">
		<div>
		<h4><img alt="like" src="member/image/m_zzim.png" width="25px">&nbsp;11찜 목록</h4>
		</div>
		<table class="table">
			<tr style="background-color: black; color: white">
				<th width="15%" class="text-center">번호</th>
				<th width="45%" class="text-left">제목</th>
				<th width="20%" class="text-center">조회수</th>
				<th width="20%" class="text-center">영업시간</th>
			</tr>
			<c:if test="${zsize!=0 }">
			<c:forEach var="vo" items="${list }">
			<tr>
				<td width="15%" class="text-center">${vo.cartvo.cb_no }</td>
				<td width="45%" class="text-left"><a href="cb_detail.do?cb_no=${vo.cartvo.cb_no }"><b>${vo.clubbarvo.cb_name }</b></a></td>
				<td width="20%" class="text-center">${vo.clubbarvo.cb_hit }</td>
				<td width="20%" class="text-center">${vo.clubbarvo.cb_open }</td>
			</tr>
			</c:forEach>
			</c:if>
		</table>
		<c:if test="${zsize==0 }">
				<p style="text-align: center; font-size: 20pt">찜한 가게가 없습니다.</p>
			</c:if>
		<c:if test="${zsize!=0 }">
		<div class="text-center">
			<a href="mypage.do?zpage=${curpage>1?curpage-1:curpage }&bpage=${bcurpage }&cpage=${ccurpage}">&lt;</a>&emsp;
				<c:forEach var="i" begin="1" end="${totalpage<1?1:totalpage }">&nbsp;
					<a href="mypage.do?zpage=${i }&bpage=${bcurpage }&cpage=${ccurpage}">
						<c:choose>
							<c:when test="${i==curpage }"><font size="4pt">${i }</font></c:when>
							<c:otherwise><font color="black">${i }</font></c:otherwise>
						</c:choose>
					</a>
				</c:forEach>&emsp;
			<a href="mypage.do?zpage=${curpage<totalpage?curpage+1:curpage }&bpage=${bcurpage }&cpage=${ccurpage}">&gt;</a>
		</div>
		</c:if>
		
	</div>
	
	<!-- 작성글 -->
	<div class="myboard">
		<div>
		<h4><img alt="board" src="member/image/m_table.png" width="25px">&nbsp;작성 글</h4>
		</div>
		<table class="table">
			<tr style="background-color: black; color: white">
				<th width="15%" class="text-center">번호</th>
				<th width="55%" class="text-left">제목</th>
				<th width="20%" class="text-center">조회수</th>
				<th width="10%" class="text-center">작성일</th>
			</tr>
			<c:if test="${bsize!=0 }">
			<c:forEach var="bvo" items="${blist }">
			<tr>
				<td width="15%" class="text-center">${bvo.b_no }</td>
				<td width="55%" class="text-left"><a href="board_content.do?no=${bvo.b_no }&grade=${bvo.b_grade}"><b>${bvo.b_subject }</b></a></td>
				<td width="20%" class="text-center">${bvo.b_hit }</td>
				<td width="10%" class="text-center"><fmt:formatDate value="${bvo.b_regdate }" pattern="yyyy.MM.dd"/></td>
			</tr>
			</c:forEach>
			</c:if>
		</table>
		<c:if test="${bsize==0 }">
			<p style="text-align: center; font-size: 20pt">작성한 글이 없습니다</p>
		</c:if>
		<c:if test="${bsize!=0 }">
		<div class="text-center">
			<a href="mypage.do?zpage=${curpage }&bpage=${bcurpage>1?bcurpage-1:bcurpage }&cpage=${ccurpage}">&lt;</a>&emsp;
				<c:forEach var="i" begin="1" end="${btotalpage<1?1:btotalpage }">&nbsp;
					<a href="mypage.do?zpage=${curpage }&bpage=${i}&cpage=${ccurpage}">
						<c:choose>
							<c:when test="${i==bcurpage }"><font size="4pt">${i }</font></c:when>
							<c:otherwise><font color="black">${i }</font></c:otherwise>
						</c:choose>
					</a>
				</c:forEach>&emsp;
			<a href="mypage.do?zpage=${curpage }&bpage=${bcurpage<btotalpage?bcurpage+1:bcurpage }&cpage=${ccurpage}">&gt;</a>
		</div>
		</c:if>
	</div>	
	
	<!-- 작성댓글  -->
	<div class="myboard">
		<div>
			<h4><img alt="comment" src="member/image/comment.png" width="25px">&nbsp;작성 댓글</h4>
		</div>
		<table class="table">
			<tr style="background-color: black; color: white">
				<th width="15%" class="text-center">번호</th>
				<th width="55%" class="text-left">댓글</th>
				<th width="20%" class="text-center"></th>
				<th width="10%" class="text-center">작성일</th>
			</tr>
			<c:if test="${csize!=0 }">
			<c:forEach var="cvo" items="${clist }">
			<tr>
				<td width="15%" class="text-center">${cvo.bc_no }</td>
				<td width="55%" class="text-left">${cvo.bc_content }</td>
				<td width="20%" class="text-center"><a href="board_content.do?no=${cvo.b_no }&grade=${cvo.bvo.b_grade}"><b>원본보기</b></a></td>
				<td width="10%" class="text-center"><fmt:formatDate value="${cvo.bc_regdate }" pattern="yyyy.MM.dd"/></td>
			</tr>
			</c:forEach>
			</c:if>
		</table>
		<c:if test="${csize==0 }">
			<p style="text-align: center; font-size: 20pt">작성한 댓글이 없습니다</p>
		</c:if>
		<c:if test="${csize!=0 }">
		<div class="text-center">
			<a href="mypage.do?zpage=${curpage }&bpage=${bcurpage}&cpage=${ccurpage>1?ccurpage-1:ccurpage }">&lt;</a>&emsp;
				<c:forEach var="i" begin="1" end="${ctotalpage<1?1:ctotalpage }">&nbsp;
					<a href="mypage.do?zpage=${curpage }&bpage=${bcurpage}&cpage=${i}">
						<c:choose>
							<c:when test="${i==ccurpage }"><font size="4pt">${i }</font></c:when>
							<c:otherwise><font color="black">${i }</font></c:otherwise>
						</c:choose>
					</a>
				</c:forEach>&emsp;
			<a href="mypage.do?zpage=${curpage }&bpage=${bcurpage}&cpage=${ccurpage<ctotalpage?ccurpage+1:ccurpage }">&gt;</a>
		</div>
		</c:if>
	</div>	
</body>
</html>