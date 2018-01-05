<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
 $(function(){
	 if(${review}=="1"){
	      $('html, body').animate({
	         scrollTop: $('.review_wrap').offset().top
	         }, 300);
	   }
}); 
</script>
</head>
<style>
#board_contentPro {
	background-image: url('member/profile/${vo.m_profile}');
}
.board_pro{
	background-size: 100%;
	border-radius: 50%;
	width: 80px;
	height: 80px;
	float: left;
}

#board_user {
	width: 200px;
	height: 80px;
	margin-left: 100px;
	padding-top: 8px;
}

#board_user p {
	margin: 0;
}

#board_name {
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 5px;
}

#board_subject {
	height: 40px;
	border-bottom: 2px solid #bbb;
}

#board_subject p {
	/* line-height: 40px; */
	font-size: 17px;
	font-weight: bold;
}

#board_content p {
	font-size: 17px;
}

#board_contentBtn {
	margin-top: 50px;
	height: 40px;
	width: 100%;
	text-align: right;
}

.board_contentBtn {
	/* float:right; */
	width: 50px;
	font-size: 15px;
}
#modal{
	position: fixed;
	top:40%;
	right: 0;
  	bottom: 0;
  	left: 0;
}
</style>
<body>
	<!-- 게시판 상세보기 -->
	<div class="content_wrap">
		<div style="height: 40px"></div>
		<div id="board_contentPro" class="board_pro"></div>
		<div id="board_user">
			<p id="board_name">${vo.m_nick }</p>
			<p id="board_regdate">
				<fmt:formatDate value="${vo.b_regdate }" pattern="yyyy-MM-dd" />
			</p>
			<p id="board_hit">조회수 ${vo.b_hit }</p>
		</div>
		<div style="height: 30px"></div>
		<!-- 게시판 상세보기  제목 -->
		<div id="board_subject">
			<p>${vo.b_subject }</p>
		</div>
		<div style="height: 20px"></div>
		<!-- 게시판 상세보기 내용 -->
		<div id="board_content">
			<p>${vo.b_content }</p>
			<c:if test="${vo.b_img_cnt>0 }">
				<p>	<br><br>
					<img src="board/boardImg/board_${vo.b_no }.jpg"/>
				</p>
			</c:if>
		</div>
		<!-- 게시판 상세보기 버튼 -->
		<div id="board_contentBtn">
			<c:if test="${vo.m_email==sessionScope.m_email }">
			<a href="board_update.do?no=${vo.b_no }">
				<input id="board_updateBtn" class="btn board_btn board_contentBtn"
					type="button" value="수정"></a>
			<input class="btn board_btn board_contentBtn" type="button" value="삭제"
					 id="deleteBtn" data-toggle="modal" data-target="#deleteModal">
			</c:if>
		<!-- 	<div id="delete" data-toggle="modal" data-target="#deleteModal">
				<img id="btn_delete" />
			</div> -->
			<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true"
				data-backdrop="static" data-keyboard="false">
				<div class="modal-dialog" id="modal">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true" style="color: black">X</span><span
									class="sr-only">Close</span>
							</button>
							<!-- 
                        		<h3 class="modal-title" id="myModalLabel"></h3> -->
						</div>
						<div class="modal-body">
							<jsp:include page="delete.jsp" />
						</div>
					</div>
				</div>
			</div>

			<a href="board_list.do?page=${page }&grade=${vo.b_grade}"><input
				class="btn board_btn board_contentBtn" type="button" value="목록"></a>

		</div>
	</div>
	<!-- 리뷰 -->
	<div class="container review_wrap">
		<jsp:include page="../board/review.jsp"></jsp:include>
	</div>

</body>
</html>