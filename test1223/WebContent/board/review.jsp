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
		//���� ���̱� �����
		$(".reply_wrap").hide();
		$(".reply_btn").click(function() {
			var btn_id = $(this).attr("id");
			btn_id = btn_id.split("_");
			if ($(this).html() == "��&nbsp;&nbsp;&nbsp;��") {
				$(this).html("��&nbsp;&nbsp;&nbsp;��");
				$("#reply_" + btn_id[2]).slideUp("500");
			} else {
				$("#reply_" + btn_id[2]).slideDown("500");
				$(this).html("��&nbsp;&nbsp;&nbsp;��");
			}
		});

		//���ۿ� ��۴ޱ�
		$(".re_reply_btn")
				.click(
						function() {
							var re_btn_id = $(this).attr("id");
							re_btn_id = re_btn_id.split("_");
							$("#re_content_" + re_btn_id[2]).val("");
							$("#re_re_pname_" + re_btn_id[2]).text("");
							$("#re_re_xBtn_" + re_btn_id[2])
									.html(
											"<img src='cb_detail/image/xBtn.png' style='width: 10px'>");
							$("#re_re_pname_" + re_btn_id[2]).text(
									"@"
											+ $(
													"#re_name_" + re_btn_id[2]
															+ "_"
															+ re_btn_id[3])
													.text() + "   ");
							$("#re_content_" + re_btn_id[2]).focus();
						});

		$(".re_re_xBtn").click(function() {
			var x_btn_id = $(this).attr("id");
			x_btn_id = x_btn_id.split("_"); //�ε��� 3���� ���̵�з�
			$("#re_re_xBtn_" + x_btn_id[3]).html("");
			$("#re_re_pname_" + x_btn_id[3]).text("");
		});

		//<span class="update_rating update_rating_${i.index }" id="update_rating_insert">
		//������ư ������ ��
		var u = 0;
		$(".review_update").hide();
		$(".up_btn").click(function() {
			var up_id = $(this).attr("id");
			up_id = up_id.split("_");
			if (u == 0) {
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
	});
</script>

</head>
<body>
	<div class="review">
		<h2>Review</h2>
		<div class="review_insert">
			<form action="board_comment_insert.do" method="post">
				<table>
					<!-- ����� ���� & ���� ���� -->
					<tr>
						<td width="10%" class="text-center">
							<div id="board_pro" style="background-image: url('member/profile/${sessionScope.m_profile }')"></div>
							<div class="pro_name">
								<!-- ����� �г��� -->
								<input type="hidden" name="m_email"
									value="${sessionScope.m_email }">
								<input type="hidden" name="b_no" value="${vo.b_no }">
								<input type="hidden" name="review" value="1">
								${sessionScope.m_nick }
							</div>
						</td>
						<td width="90%"><textarea class="form-control" rows="5"
								cols="100%" name="bc_content"></textarea></td>

						<!-- ���� & ��ư -->
					</tr>

					<tr>
						<td>
							
						</td>
						<td class="text-right">
							<div class="star_insert">
								<input type="submit" class="btn review_btn"
									value="��&nbsp;&nbsp;&nbsp;&nbsp;��" />
							</div>

						</td>

					</tr>
				</table>
			</form>

		</div>


		<!-- ���� ����Ʈ -->
		<div class="review_reply">
			<c:forEach var="bc_vo" items="${clist }" varStatus="i">
				<table class="reviewlist" id="reviewlist_${i.index }">
					<!-- ����� ���� & ���� -->
					<tr>
						<td width="10%" class="text-center user_info">
							<div id="reply_pro"
								style="background-image: url('member/profile/${bc_vo.mvo.m_profile }')"></div>
							<div class="pro_name">
								<!-- ����� �г��� -->
								<!-- �ӽ÷� �̸��� -->
								${bc_vo.mvo.m_nick }
								<!-- ����г��� -->
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

					<!-- ���� & ��� ��ư -->
					<tr>
						<td width="10%" class="text-center"></td>
						<td width="90%" class="text-right"><span> <!-- �����ϳ�¥ -->
								${bc_vo.dbday }<!-- 2017-12-11 -->&nbsp;&nbsp;&nbsp; <c:if
									test="${sessionScope.m_email == bc_vo.m_email  }">
									<span class="up_btn" id="up_${i.index }">�� ��</span>&nbsp;&nbsp;
									<span class="del_btn" id="del_${i.index }">�� ��</span>&nbsp;&nbsp;
								</c:if>

						</span>
							<button class="btn reply_btn" id="reply_btn_${i.index }">��&nbsp;&nbsp;&nbsp;��</button></td>
					</tr>
				</table>

				<!-- --------------------------------------------------------------------- ���� -->
				<div class="review_update" id="review_up_${i.index }">
					<form action="cbc_update.do" method="post">
						<table>
							<!-- ����� ���� & ���� ���� -->
							<tr>
								<td width="10%" class="text-center">
									<div id="board_pro" style="background-image: url('member/profile/${bc_vo.mvo.m_profile }')"></div>
									<div class="pro_name">
										<!-- ����� �г��� -->
										<input type="hidden" name="m_email"
											value="${sessionScope.m_email }"> <input
											type="hidden" name="b_no" value="${bc_vo.b_no }"> <input
											type="hidden" name="bc_no" value="${bc_vo.bc_no }">
										<input type="hidden" name="review" value="1">
										${sessionScope.m_nick }
									</div>
								</td>
								<td width="90%"><textarea class="form-control" rows="5"
										cols="100%" name="cbc_content">${bc_vo.bc_content }</textarea>
								</td>

								<!-- ���� & ��ư -->
							</tr>

							<tr>
								<td>
									<div class="list_star">
										<!-- �����ֱ�  id="update_rating_insert"-->

									</div>
								</td>
								<td class="text-right">
									<div class="star_insert">
										<input type="button" class="btn re_noupdate_btn"
											id="no_up_${i.index }" value="��&nbsp;&nbsp;&nbsp;&nbsp;��" />
										<input type="submit" class="btn re_update_btn"
											id="up_${i.index }" value="��&nbsp;&nbsp;&nbsp;&nbsp;��" />
									</div>

								</td>

							</tr>
						</table>
					</form>

				</div>
				<!-- --------------------------------------------------------------------- ���� -->

				<!-- ���� ����Ʈ & ���� ��� -->
				<div class="reply_wrap" id="reply_${i.index }">
					<%-- <c:forEach var="j" begin="1" end="3"> --%>
					<c:forEach var="cvo" items="${rc_list }" varStatus="j">
						<!-- ���� ����Ʈ -->
						<c:if test="${cvo.cbc_root==cbc_vo.cbc_no }">
							<table class="reply_list">
								<!-- ����� ���� & ���� -->
								<tr>
									<td widht="3%" class="reply_tab"></td>
									<td rowspan="2" width="100px"
										class="text-center user_info reply_user">
										<div id="reply_pro"
											style="background-image: url('cb_detail/image/pro.png')"></div>
										<div class="reply_name" id="re_name_${i.index }_${j.index }">
											<!-- ����г��� -->${cvo.m_nick }</div>
									</td>
									<td width="87%" class="text-left reply_content_td">
										<div class="reply_content">
											<p>
												<!-- �� ���� ��������? �ҹ��� ���ζ����...!!! -->
												${cvo.cbc_content }
											</p>
										</div>
									</td>
								</tr>

								<!-- ���� & ��� ��ư -->
								<tr>
									<td colspan="2"></td>
									<td width="87%" class="text-right"><span> <!-- �����ϳ�¥ -->
											<!-- 2017-12-15 -->${cvo.dbday }&nbsp;&nbsp;&nbsp;
									</span> <c:if test="${sessionScope.m_email == cvo.m_email  }">
											<span>�� ��</span>&nbsp;&nbsp;<span>�� ��</span>&nbsp;&nbsp;
										</c:if>
										<button class="btn re_reply_btn"
											id="re_btn_${i.index }_${j.index }">��&nbsp;&nbsp;&nbsp;��</button>
									</td>
								</tr>
							</table>
						</c:if>
					</c:forEach>

					<div id="reply_page">
						<center>
							<a href="#"><</a>&nbsp;&nbsp;&nbsp;
							<c:forEach var="k" begin="1" end="10">
								<a href="#">${k }</a>&nbsp;
			               </c:forEach>
							&nbsp;&nbsp;&nbsp;<a href="#">></a>
						</center>
					</div>
					<!-- ���� ���---------------------------------------------------------------------------------------------- -->
					<form action="re_reply_insert.do" method="post">
						<table class="reply_insert">
							<!-- ����� ���� & ���� -->
							<tr>
								<td widht="3%" class="reply_tab"></td>
								<td rowspan="2" width="100px"
									class="text-center user_info reply_user">
									<div id="reply_pro"
										style="background-image: url('member/profile/${sessionScope.m_profile }')"></div>
									<div class="reply_name">
										<!-- ����� �г��� -->
										<input type="hidden" name="m_email"
											value="${sessionScope.m_email }"> <input
											type="hidden" name="b_no" value="${vo.b_no }"> <input
											type="hidden" name="cbc_pno" value="${bc_vo.bc_root }">
										<input type="hidden" name="review" value="1">
										${sessionScope.m_nick }
									</div>

								</td>
								<td width="87%" class="text-left reply_content_td">
									<div class="re_re_pname" id="re_re_pname_${i.index }">
										<span id="re_re_pname_${i.index }"></span> <a
											id="re_re_xBtn_${i.index }" class="re_re_xBtn"></a>
									</div>
									<div class="re_content_insert">
										<textarea class="form-control" rows="2"
											id="re_content_${i.index }" name="cbc_content"></textarea>
									</div>
								</td>
							</tr>

							<!-- ���� & ��� ��ư -->
							<tr>
								<td colspan="2"></td>
								<td width="87%" class="text-right"><input type="submit"
									class="btn reply_insert_btn" value="��&nbsp;&nbsp;&nbsp;��" /></td>
							</tr>
						</table>
					</form>
				</div>
			</c:forEach>

		</div>
		<div id="board_page">
			<center>
				<a href="#"><</a>&nbsp;&nbsp;&nbsp;
				<c:forEach var="i" begin="1" end="${totalpage }">
					<a href="#">${i }</a>&nbsp;
                </c:forEach>
				&nbsp;&nbsp;&nbsp;<a href="#">></a>
			</center>
		</div>
	</div>
</body>
</html>