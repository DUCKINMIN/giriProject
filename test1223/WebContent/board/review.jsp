<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!-- <script src="path/to/js/star-rating.min.js" type="text/javascript"></script> -->
<style>

.review_wrap {
	margin-top: 70px;
}

.review h2 {
	font-weight: bold;
	padding-bottom: 10px;
	border-bottom: 2px solid #bbb;
}

.review_insert, .review_update {
	width: 100%;
	height: 150px;
}

.pro_name {
	margin-top: 13px;
}

.profile {
	line-height: 100px;
}

.review_btn {
	width: 100px;
	background: rgb(162, 0, 0);
	color: #fff;
	font-size: 17px;
}

.review_btn:hover, .review_btn:focus {
	color: #fff;
}

.review_insert table, .review_update table {
	width: 100%;
	height: 150px;
}

.review_insert table textarea, .review_update table textarea {
	resize: none;
}

.reviewlist {
	width: 100%;
}

.reviewlist th td {
	vertical-align: middle;
	line-height: 100%;
	padding-top: 70px;
}

.review_content {
	margin-left: 20px;
	padding: 20px 0px;
}
.reply_btn, .reply_insert_btn, .re_reply_btn, .re_update_btn,
	.re_noupdate_btn {
	color: #262626;
	background: #fff;
	border: 1px solid #999;
}

.review_btn {
	float: right;
	margin-top: 4px;
}

.reviewlist {
	border-top: 1px solid #ccc;
}

.user_info .board_pro {
	margin-top: 20px;
}
#board_pro{
	background-size: 100%;
	border-radius: 50%;
	width: 70px;
	height: 70px;
	margin: 10px auto;
}

.list_star img {
	width: 110px;
	float: left;
}

.review_insert, .review_update {
	margin-bottom: 10px;
}

.review_update {
	border-top: 1px solid #ddd;
}

#reply_pro {
	background-size: 100%;
	border-radius: 50%;
	width: 40px;
	height: 40px;
	margin: 10px auto;
}

.reply_list {
	border-top: 1px solid #ddd;
	width: 100%;
	background: rgb(247, 247, 247);
}

.reply_content {
	margin-top: 10px;
}

.reply_insert {
	width: 100%;
	border-top: 1px solid #ddd;
	background: rgb(247, 247, 247);
}

.reply_insert tr td textarea {
	resize: none;
}

.reply_btn, .reply_insert_btn {
	margin: 4px 0px;
}

.re_re_xBtn {
	cursor: pointer;
}

.review {
	margin-bottom: 50px;
}

#board_page a {
	color: #262626;
}

#reply_page a {
	color: #262626;
}

#reply_page {
	width: 100%;
	border-top: 1px solid #ddd;
	padding: 5px 0px;
	background: rgb(247, 247, 247);
}
.click_ok {
	cursor: pointer;
}
@media ( max-width : 570px) {
	.reply_list td:first-child, .reply_insert td:first-child {
		width: 60px;
	}
	.reply_list td:nth-child(2), .reply_insert td:nth-child(2) {
		width: 100px;
	}
	.reply_content_td, .reply_insert td:last-child {
		width: 400px;
	}
}

@media screen and (max-width: 995px) and (min-width: 569px) {
	.reply_list td:first-child, .reply_insert td:first-child {
		width: 20px;
	}
	.reply_list td:nth-child(2), .reply_insert td:nth-child(2) {
		width: 100px;
	}
	.reply_content_td, .reply_insert td:last-child {
		width: 600px;
	}
}
</style>

<script type="text/javascript">
	$(function() {
		//대댓글 보이기 숨기기
		$(".reply_wrap").hide();
		$(".reply_btn").click(function() {
			var btn_id = $(this).attr("id");
			btn_id = btn_id.split("_");
			if ($(this).html() == "닫&nbsp;&nbsp;&nbsp;기") {
				$(this).html("댓&nbsp;&nbsp;&nbsp;글");
				$("#reply_" + btn_id[2]).slideUp("500");
			} else {;
				$("#reply_" + btn_id[2]).slideDown("500");
				$(this).html("닫&nbsp;&nbsp;&nbsp;기");
			}
		});

		//대댓글에 댓글달기 => 대대댓글
		$(".re_reply_btn").click(function() {
			var re_btn_id = $(this).attr("id");
			re_btn_id = re_btn_id.split("_");
			$("#re_content_" + re_btn_id[2]).val("");
			$("#re_re_nick_" + re_btn_id[2]).text("");
			$("#re_re_nick_" + re_btn_id[2]).text("@" + $("#re_name_" + re_btn_id[2] + "_" + re_btn_id[3]).text() + "   ");
			
			$("#re_re_xBtn_" + re_btn_id[2]).html("<img src='cb_detail/image/xBtn.png' style='width: 10px'>");
			$(".re_content_update_" + re_btn_id[2]).append("<input type='hidden' name='bc_pcno' value='" + re_btn_id[4] + "'>");
			$(".re_content_update_" + re_btn_id[2]).append("<input type='hidden' name='bc_pcnick' value='"+ 
									"@" + $("#re_name_" + re_btn_id[2] + "_" + re_btn_id[3]).text() + "   " +"'>");
			$("#re_content_" + re_btn_id[2]).focus();
		});
		//<textarea class="form-control" rows="2" id="re_content_${i.index }" name="cbc_content"></textarea>
		$(".re_re_xBtn").click(function() {
			var x_btn_id = $(this).attr("id");
			x_btn_id = x_btn_id.split("_"); //인덱스 3으로 아이디분류
			$("#re_re_xBtn_" + x_btn_id[3]).html("");
			$("#re_re_nick_" + x_btn_id[3]).text("");
			$(".re_content_update_" + re_btn_id[2]).html("<textarea class='form-control' rows='2' id='re_content_${i.index }' name='bc_content'></textarea>");
		});
		
		//<span class="update_rating update_rating_${i.index }" id="update_rating_insert">
		//댓글 = 수정버튼 눌렀을 때
		var u = 0;
		$(".review_update").hide();
		$(".up_btn").click(function() {
			var up_id = $(this).attr("id");
			up_id = up_id.split("_");
			if(u == 0) {
				u = 1;
				$("#input_" + up_id[1]).addClass("input");
				$("#review_up_" + up_id[1]).show();
				$("#reviewlist_" + up_id[1]).hide();
			}
			
		});
		
		$(".re_noupdate_btn").click(function() {
			var up_id = $(this).attr("id");
			up_id = up_id.split("_");
			u = 0;
			$("#review_up_" + up_id[2]).hide();
			$("#input_" + up_id[2]).removeClass("input");
			$("#reviewlist_" + up_id[2]).show();
		});
		
		var ru = 0;
		$(".reply_update").hide();
		$(".re_up_btn").click(function() {
			var up_id = $(this).attr("id");
			up_id = up_id.split("_");
			if(u == 0) {
				u = 1;
				$("#reply_up_" + up_id[3] + "_" + up_id[4]).show();
				$("#replylist_" + up_id[3] + "_" + up_id[4]).hide();
			}
		});
		$(".rere_noup_btn").click(function() {
			var up_id = $(this).attr("id");
			up_id = up_id.split("_");
			u = 0;
			$("#reply_up_" + up_id[2] + "_" + up_id[3]).hide();
			$("#replylist_" + up_id[2] + "_" + up_id[3]).show();
		}); 
		
		//댓글 삭제버튼 눌렀을 때
		$(".del_btn").click(function() {
			var del_id = $(this).attr("id");
			
			del_id = del_id.split("_");
			$('#delFrm_'+del_id[1]).submit();
			alert("댓글이 삭제되었습니다");
		});

		/* $(".re_noupdate_btn").click(function() {
			var up_id = $(this).attr("id");
			up_id = up_id.split("_");
			u = 0;
			$("#review_up_" + up_id[2]).hide();
			$("#input_" + up_id[2]).removeClass("input");
			$("#reviewlist_" + up_id[2]).show();
		}); */
	});
</script>
</head>
<body>
	<div class="review">
		<h2>Review</h2>
		<div class="review_insert">
			<form action="board_comment_insert.do" method="post">
				<table>
					<!-- 사용자 정보 & 리뷰 내용 -->
					<tr>
						<td width="10%" class="text-center">
							<div id="board_pro" style="background-image: url('member/profile/${sessionScope.m_profile }')"></div>
							<div class="pro_name">
								<!-- 사용자 닉네임 -->
								<input type="hidden" name="m_email"
									value="${sessionScope.m_email }">
								<input type="hidden" name="b_no" value="${vo.b_no }">
								<input type="hidden" name="review" value="1">
								<input type="hidden" name="grade" value="${vo.b_grade }">
								<input type="hidden" name="page" value="${page}">
								${sessionScope.m_nick }
							</div>
						</td>
						<td width="90%"><textarea class="form-control" rows="5"
								cols="100%" name="bc_content"></textarea></td>

						<!-- 별점 & 버튼 -->
					</tr>

					<tr>
						<td>
							
						</td>
						<td class="text-right">
							<div class="star_insert">
								<input type="submit" class="btn review_btn"
									value="등&nbsp;&nbsp;&nbsp;&nbsp;록" />
							</div>

						</td>

					</tr>
				</table>
			</form>

		</div>


		<!-- 리뷰 리스트 -->
		<div class="review_reply">
			<c:forEach var="bc_vo" items="${clist }" varStatus="i">
				<table class="reviewlist" id="reviewlist_${i.index }">
					<!-- 사용자 정보 & 내용 -->
					<tr>
						<td width="10%" class="text-center user_info">
							<div id="reply_pro"
								style="background-image: url('member/profile/${bc_vo.mvo.m_profile }')"></div>
							<div class="pro_name">
								<!-- 사용자 닉네임 -->
								<!-- 임시로 이메일 -->
								${bc_vo.mvo.m_nick }
								<!-- 리뷰닉네임 -->
							</div>
						</td>
						<td width="90%" class="text-left">
							<div class="review_content">
								<p>
									${bc_vo.bc_content }
								</p>
							</div>
						</td>
					</tr>

					<!-- 별점 & 댓글 버튼 -->
					<tr>
						<td width="10%" class="text-center"></td>
						<td width="90%" class="text-right"><span> <!-- 리뷰등록날짜 -->
								${bc_vo.dbday }<!-- 2017-12-11 -->&nbsp;&nbsp;&nbsp; <c:if
									test="${sessionScope.m_email == bc_vo.m_email  }">
									<span class="up_btn" id="up_${i.index }">수 정</span>&nbsp;&nbsp;
									<form action="board_comment_delete.do" method="post" id="delFrm_${bc_vo.bc_no }">
									<span class="del_btn" id="del_${bc_vo.bc_no }">삭 제</span>&nbsp;&nbsp;
									<input type="hidden" name="b_no" value="${bc_vo.b_no }"> 
									<input type="hidden" name="bc_no" value="${bc_vo.bc_no }">
									<input type="hidden" name="grade" value="${vo.b_grade }">
									<input type="hidden" name="page" value="${page}">
									<input type="hidden" name="rpage" value="${curpage }">
									</form>
								</c:if>

						</span>
							<button class="btn reply_btn" id="reply_btn_${i.index }">댓&nbsp;&nbsp;&nbsp;글</button></td>
					</tr>
				</table>

				<!-- --------------------------------------------------------------------- 수정 -->
				<div class="review_update" id="review_up_${i.index }">
					<form action="board_comment_update.do" method="post">
						<table>
							<!-- 사용자 정보 & 리뷰 내용 -->
							<tr>
								<td width="10%" class="text-center">
									<div id="board_pro" style="background-image: url('member/profile/${bc_vo.mvo.m_profile }')"></div>
									<div class="pro_name">
										<!-- 사용자 닉네임 -->
										<input type="hidden" name="m_email"
											value="${sessionScope.m_email }"> <input
											type="hidden" name="b_no" value="${bc_vo.b_no }"> <input
											type="hidden" name="bc_no" value="${bc_vo.bc_no }">
											<input type="hidden" name="grade" value="${vo.b_grade }">
											<input type="hidden" name="page" value="${page}">
											<input type="hidden" name="rpage" value="${curpage}">
										<input type="hidden" name="review" value="1">
										${sessionScope.m_nick }
									</div>
								</td>
								<td width="90%"><textarea class="form-control" rows="5"
										cols="100%" name="bc_content">${bc_vo.bc_content }</textarea>
								</td>

								<!-- 별점 & 버튼 -->
							</tr>

							<tr>
								<td class="text-right" colspan="2">
									<div class="star_insert">
										<input type="button" class="btn re_noupdate_btn"
											id="no_up_${i.index }" value="취&nbsp;&nbsp;&nbsp;&nbsp;소" />
										<input type="submit" class="btn re_update_btn"
											id="up_${i.index }" value="수&nbsp;&nbsp;&nbsp;&nbsp;정" />
									</div>

								</td>

							</tr>
						</table>
					</form>

				</div>
				<!-- --------------------------------------------------------------------- 수정 -->

				<!-- 대댓글 리스트 & 대댓글 등록 -->
				<div class="reply_wrap" id="reply_${i.index }">
					<%-- <c:forEach var="j" begin="1" end="3"> --%>
					<c:forEach var="cvo" items="${cclist }" varStatus="j">
						<!-- 대댓글 리스트 -->
						<c:if test="${cvo.bc_group_id==bc_vo.bc_group_id }">
							<table class="reply_list" id="replylist_${i.index }_${j.index}">
								<!-- 사용자 정보 & 내용 -->
								<tr>
									<td widht="3%" class="reply_tab"></td>
									<td rowspan="2" width="100px"
										class="text-center user_info reply_user">
										<div id="reply_pro"
											style="background-image: url('member/profile/${cvo.m_email}.jpg')"></div>
										<!-- 리뷰닉네임 -->
										<div class="reply_name" id="re_name_${i.index }_${j.index }">${cvo.mvo.m_nick }</div>
									</td>
									<td width="87%" class="text-left reply_content_td">
										<div class="reply_content">
											<p>
												<!-- 와 여기 괜찮나요? 소문은 별로라던데...!!! -->
												${cvo.bc_content }
											</p>
										</div>
									</td>
								</tr>

								<!-- 별점 & 댓글 버튼 -->
								<tr>
									<td colspan="2"></td>
									<td width="87%" class="text-right">
										<span>
											${cvo.dbday }&nbsp;&nbsp;&nbsp;
										</span> 
										
										<c:if test="${sessionScope.m_email == cvo.m_email  }">
											<span class="click_ok re_up_btn" id="re_up_btn_${i.index }_${j.index}">수 정</span>&nbsp;&nbsp;
											<form action="board_comment_delete.do" method="post" id="delFrm_${cvo.bc_no }">
											<span class="click_ok del_btn" id="del_${cvo.bc_no }">삭 제</span>&nbsp;&nbsp;
											<input type="hidden" name="b_no" value="${bc_vo.b_no }"> 
											<input type="hidden" name="bc_no" value="${cvo.bc_no }">
											<input type="hidden" name="grade" value="${vo.b_grade }">
											<input type="hidden" name="page" value="${page}">
											<input type="hidden" name="rpage" value="${curpage}">
											</form>
										</c:if>
										<button class="btn re_reply_btn"  id="re_btn_${i.index }_${j.index }_${cvo.bc_no}">댓&nbsp;&nbsp;&nbsp;글</button>
									</td>
								</tr>
							</table>
						</c:if>
						<!-- 대댓글 수정-------------------------------------------------------------------------------------------------- -->
						<div class="reply_update" id="reply_up_${i.index }_${j.index}">
							<form action="board_comment_update.do" method="post">
								<table class="reply_insert">
									<!-- 사용자 정보 & 내용 -->
									<tr>
										<td widht="3%" class="reply_tab"></td>
										<td rowspan="2" width="100px"
											class="text-center user_info reply_user">
											<div id="reply_pro"  style="background-image: url('member/profile/${sessionScope.m_profile }')"></div>
											<div class="reply_name"><!-- 사용자 닉네임 -->
												<input type="hidden" name="m_email" value="${sessionScope.m_email }">
												<input type="hidden" name="b_no" value="${vo.b_no }">
												<input type="hidden" name="bc_no" value="${cvo.bc_no }">
												<input type="hidden" name="review" value="1">
												<input type="hidden" name="grade" value="${vo.b_grade }">
												<input type="hidden" name="page" value="${page}">
												<input type="hidden" name="rpage" value="${curpage }">
												${sessionScope.m_nick }
											</div>
											
										</td>
										<td width="87%" class="text-left reply_content_td">
											<div class="re_re_pname" id="re_re_pname_${i.index }">
												<span id="re_reup_nick_${i.index }" ></span>
												<a id="re_re_xBtnup_${i.index }" class="re_re_xBtn"></a>
											</div>
											<div class="re_content_insert">
												<textarea class="form-control" rows="2" id="rere_content_${i.index }" name="bc_content">${cvo.bc_content }</textarea>
											</div>
										</td>
									</tr>
			
									<!-- 별점 & 댓글 버튼 -->
									<tr>
										<td colspan="2"></td>
										<td width="87%" class="text-right">
											<input type="button" class="btn rere_noup_btn" id="rere_noup_${i.index }_${j.index}" value="취&nbsp;&nbsp;&nbsp;소" />
											<input type="submit" class="btn rere_update_btn" id="rere_up_${i.index }_${j.index}" value="수&nbsp;&nbsp;&nbsp;정" />
										</td>
									</tr>
								</table>
							</form>
						</div>
						<!--대댓글수정 --------------------------------------------------------------------------------------------------------- -->
					</c:forEach>
<%-- 
					<div id="reply_page">
						<center>
							<a href="#"><</a>&nbsp;&nbsp;&nbsp;
							<c:forEach var="k" begin="1" end="${ccpage }">
								<a href="#">${k }</a>&nbsp;
			               </c:forEach>
							&nbsp;&nbsp;&nbsp;<a href="#">></a>
						</center>
					</div> --%>
					<!-- 대댓글 등록---------------------------------------------------------------------------------------------- -->
					<form action="board_cocoment_insert.do" method="post">
						<table class="reply_insert">
							<!-- 사용자 정보 & 내용 -->
							<tr>
								<td widht="3%" class="reply_tab"></td>
								<td rowspan="2" width="100px"
									class="text-center user_info reply_user">
									<div id="reply_pro"
										style="background-image: url('member/profile/${sessionScope.m_profile }')"></div>
									<div class="reply_name">${sessionScope.m_nick }
										<!-- 사용자 닉네임 -->
										<input type="hidden" name="m_email"
											value="${sessionScope.m_email }"> <input
											type="hidden" name="b_no" value="${vo.b_no }"> <input
											type="hidden" name="bc_root" value="${bc_vo.bc_no }">
										<input type="hidden" name="review" value="1">
										<input type="hidden" name="grade" value="${vo.b_grade }">
										<input type="hidden" name="rpage" value="${curpage }">
											<input type="hidden" name="page" value="${page}">
									</div>

								</td>
								<td width="87%" class="text-left reply_content_td">
									<div class="re_re_pname" id="re_re_pname_${i.index }">
										<span id="re_re_nick_${i.index }" ></span>
										<a id="re_re_xBtn_${i.index }" class="re_re_xBtn"></a>
									</div>
									<div class="re_content_update_${i.index }">
										<textarea class="form-control" rows="2" id="re_content_${i.index }" name="bc_content"></textarea>
									</div>
								</td>
							</tr>

							<!-- 별점 & 댓글 버튼 -->
							<tr>
								<td colspan="2"></td>
								<td width="87%" class="text-right"><input type="submit"
									class="btn reply_insert_btn" value="등&nbsp;&nbsp;&nbsp;록" /></td>
							</tr>
						</table>
					</form>
				</div>
			</c:forEach>

		</div>
		<div id="board_page">
			<center>
				<%-- <a href="#"><</a>&nbsp;&nbsp;&nbsp;
				<c:forEach var="i" begin="1" end="${totalpage }">
					<a href="#">${i }</a>&nbsp;
                </c:forEach>
				&nbsp;&nbsp;&nbsp;<a href="#">></a> --%>
				<c:choose>
					<c:when test="${curpage>block }">
						<a
							href="board_content.do?no=${vo.b_no }&rpage=${fromPage-1 }&grade=${grade }&page=${page }&review=1"><
							&nbsp;</a>
					</c:when>
					<c:otherwise>
						<span><&nbsp;</span>
					</c:otherwise>
				</c:choose>
				<c:forEach var="i" begin="${fromPage }" end="${toPage }">
					<c:if test="${i==curpage }">
				         <b style="font-size:18px">${i }</b> &nbsp;
				        </c:if>
					<c:if test="${i!=curpage }">
						<a href="board_content.do?no=${vo.b_no }&rpage=${i }&grade=${grade }&page=${page }&review=1">${i }&nbsp;</a>
					</c:if>
				</c:forEach>
				<c:choose>
					<c:when test="${toPage<allpage }">
						<a
							href="board_content.do?no=${vo.b_no }&rpage=${toPage+1 }&grade=${grade }&page=${page }&review=1">></a>
					</c:when>
					<c:otherwise>
						<span>></span>
					</c:otherwise>
				</c:choose>
			</center>
		</div>
	</div>
</body>
</html>