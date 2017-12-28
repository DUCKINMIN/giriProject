<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

<style>
.review_wrap {
	margin-top: 70px;
}
.review h2 {
	font-weight: bold;
	padding-bottom:10px;
	border-bottom: 2px solid #bbb;
}
.review_insert {
	width:100%;
	height:150px;
}
.board_pro{
    background-image: url('../image/pro.png');
    background-size: 100%;
    border-radius: 50%;
    width: 70px;
    height: 70px;
    margin:10px auto;
}
#board_replypro{
	background-image: url('../image/kang.PNG');
}
.pro_name {
    margin-top: 13px;
}
.profile {
    line-height: 100px;
}

.review_btn {
	width:100px;
	background: rgb(162,0,0);
	color: #fff;
	font-size: 17px;
}
.review_btn:hover, .review_btn:focus {
	color:#fff;
}
.review_insert table {
	width:100%;
	height:150px;
}
.review_insert table textarea {
	resize: none;
}
.reviewlist {
	width:100%;
}
.reviewlist th td {
	vertical-align: middle;
	line-height: 100%;
	padding-top: 70px;
}
.review_content {
	margin-left: 20px;
	padding:20px 0px;
}
@media (max-width: 509px) {
  .cb_info_table {
  	width:247px;
  }
  .like, .rating, .hit{
  	padding: 5px 5px;
  }
  .like h2,.rating h2,.hit h2 {
  	font-size:20px;
  	font-weight: bold;
  }
  .cb_detail p {
  	font-size: 20px;
  }
}

@media (max-width: 1100px) {
	.cb_detail {
		width:90%;
	}
}
.reply_btn, .reply_insert_btn, .re_reply_btn {
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

.list_star img {
	width: 110px;
	float: left;
}

.review_insert {
	margin-bottom: 10px;
}

#reply_pro {
	background-image: url('../cb_Detail/image/pro.png');
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
.review {
	margin-bottom: 50px;
}
#board_page{
	margin-top: 30px;
}
#board_page a {
	color : #262626;
}
#reply_page a {
	color : #262626;
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
		//대댓글 보이기 숨기기
		$(".reply_wrap").hide();
		$(".reply_btn").click(function() {
				var btn_id = $(this).attr("id");
				btn_id = btn_id.split("_");
				if($(this).html() == "닫&nbsp;&nbsp;&nbsp;기") {
					$(this).html("댓&nbsp;&nbsp;&nbsp;글");
					$("#reply_" + btn_id[2]).slideUp("500");
				}
				else {
					$("#reply_" + btn_id[2]).slideDown("500");
					$(this).html("닫&nbsp;&nbsp;&nbsp;기");
				}
		});
		
		//대댓글에 댓글달기
		$(".re_reply_btn").click(function() {
			var re_btn_id = $(this).attr("id");
			re_btn_id = re_btn_id.split("_");
			$("#re_content_" + re_btn_id[2]).val("");
			$("#re_content_" + re_btn_id[2]).val(
					 "@"+ $("#re_name_" + re_btn_id[2] + "_" + re_btn_id[3]).text() + "   ");
			$("#re_content_" + re_btn_id[2]).focus();
		});
	});
</script>

</head>
<body>
	<div class="review">
		<h2>Reply</h2>
		<div class="review_insert">
			<table>
				<!-- 사용자 정보 & 리뷰 내용 -->
				<tr>
					<td width="10%" class="text-center">
						<div class="board_pro"></div>
						<div class="pro_name">
							<!-- 사용자 닉네임 -->
							USER
						</div>
					</td>
					<td width="90%"><textarea class="form-control" rows="5"
							cols="100%"></textarea></td>
					<!-- 별점 & 버튼 -->
				</tr>
				<tr>
					<td>
						
					</td>
					<td class="text-right">
						<div class="star_insert">
							<input type="button" class="btn review_btn"
								value="등&nbsp;&nbsp;&nbsp;&nbsp;록" />
						</div>
					</td>
				</tr>
			</table>

		</div>

		<!-- 리뷰 리스트 -->
		<div class="review_reply">
			<c:forEach var="i" begin="1" end="5">
				<table class="reviewlist">
					<!-- 사용자 정보 & 내용 -->
					<tr>
						<td width="10%" class="text-center user_info">
							<div class="board_pro" id="board_replypro"></div>
							<div class="pro_name">
								<!-- 사용자 닉네임 -->
								리뷰닉네임
							</div>
						</td>
						<td width="90%" class="text-left">
							<div class="review_content">
								<p>
									저 어제 여기 다녀왔는데요....<br> 사장님은 너무 친절하셨는데 알바생인지 매니저였는지 모르겠지만..<br>
									너무 불친절했어요...기분 좋게 놀러갔다가 기분 나쁜채로 나왔네요..<br> 알바생만 아니면 너무
									놀기좋은 곳입니다!!! 어제 썸남생겼네요!!! ㅎㅎ헤개꿀
								</p>
							</div>
						</td>
					</tr>

					<!-- 별점 & 댓글 버튼 -->
					<tr>
						<td width="10%" class="text-center">
							
						</td>
						<td width="90%" class="text-right"><span>
								<!-- 리뷰등록날짜 -->2017-12-15&nbsp;&nbsp;&nbsp;
						</span> <button class="btn reply_btn" id="reply_btn_${i }">댓&nbsp;&nbsp;&nbsp;글</button></td>
					</tr>
				</table>
				<!-- 대댓글 리스트 & 대댓글 등록 -->
				<div class="reply_wrap" id="reply_${i }">
					<c:forEach var="j" begin="1" end="3">
						<!-- 대댓글 리스트 -->
						<table class="reply_list">
							<!-- 사용자 정보 & 내용 -->
							<tr>
								<td width="3%" class="reply_tab"></td>
								<td rowspan="2" width="100px"
									class="text-center user_info reply_user">
									<div id="reply_pro"></div>
									<div class="reply_name" id="re_name_${i }_${j }">리뷰닉네임</div>
								</td>
								<td width="87%" class="text-left reply_content_td">
									<div class="reply_content">
										<p>와 여기 괜찮나요? 소문은 별로라던데...!!!</p>
									</div>
								</td>
							</tr>

							<!-- 별점 & 댓글 버튼 -->
							<tr>
								<td colspan="2"></td>
								<td width="87%" class="text-right"><span>
										<!-- 리뷰등록날짜 -->2017-12-15&nbsp;&nbsp;&nbsp;
								</span> <button class="btn re_reply_btn"  id="re_btn_${i }_${j }">댓&nbsp;&nbsp;&nbsp;글</button></td>
							</tr>
						</table>
				
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
					<!-- 대댓글 등록 -->
					<table class="reply_insert">
						<!-- 사용자 정보 & 내용 -->
						<tr>
							<td widht="3%" class="reply_tab"></td>
							<td rowspan="2" width="100px"
								class="text-center user_info reply_user">
								<div id="reply_pro"></div>
								<div class="reply_name"><!-- 사용자 닉네임 -->리뷰닉네임</div>
							</td>
							<td width="87%" class="text-left reply_content_td">
								<div class="re_content_insert">
									<textarea class="form-control" rows="2" id="re_content_${i }"></textarea>
								</div>
							</td>
						</tr>

						<!-- 별점 & 댓글 버튼 -->
						<tr>
							<td colspan="2"></td>
							<td width="87%" class="text-right"><input type="button"
								class="btn reply_insert_btn" value="등&nbsp;&nbsp;&nbsp;록" /></td>
						</tr>
					</table>
				</div>
			</c:forEach>
			
		</div>
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
</body>
</html>