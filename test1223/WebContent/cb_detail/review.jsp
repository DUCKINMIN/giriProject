<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="path/to/js/star-rating.min.js" type="text/javascript"></script>
<style>
.reply_btn, .reply_insert_btn, .re_reply_btn,
 .re_update_btn, .re_noupdate_btn, .rere_noup_btn, .rere_update_btn {
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
.click_ok {
	cursor: pointer;
}
form {
	display: inline;
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
				if($(this).html() == "��&nbsp;&nbsp;&nbsp;��") {
					$(this).html("��&nbsp;&nbsp;&nbsp;��");
					$("#reply_" + btn_id[2]).slideUp("500");
				}
				else {
					$("#reply_" + btn_id[2]).slideDown("500");
					$(this).html("��&nbsp;&nbsp;&nbsp;��");
				}
		});
		
			var starRating_up = function(i){
				  var $star = $("#update_rating_insert" + i),
				      $result = $star.find("output>strong");
				  $(document)
				    .on("focusin", "#update_rating_insert" + i + ">.input", function(){
				    $(this).addClass("focus");
				  })
				    .on("focusout", "#update_rating_insert" + i + ">.input", function(){
				    var $this = $(this);
				    setTimeout(function(){
				      if($this.find(":focus").length === 0){
				        $this.removeClass("focus");
				      }
				    }, 100);
				  })
				    .on("change", "#update_rating_insert" + i + " :radio", function(){
				    $result.text($(this).next().text());
				  })
				    .on("mouseover", "#update_rating_insert" + i + " label", function(){
				    $result.text($(this).text());
				  })
				    .on("mouseleave", "#update_rating_insert" + i + ">.input", function(){
				    var $checked = $star.find(":checked");
				    if($checked.length === 0){
				      $result.text("0");
				    } else {
				      $result.text($checked.next().text());
				    }
				  });
				};

		
		//���ۿ� ��۴ޱ� => �����
		$(".re_reply_btn").click(function() {
			var re_btn_id = $(this).attr("id");
			re_btn_id = re_btn_id.split("_");
			$("#re_content_" + re_btn_id[2]).val("");
			$("#re_re_nick_" + re_btn_id[2]).text("");
			$("#re_re_nick_" + re_btn_id[2]).text("@" + $("#re_name_" + re_btn_id[2] + "_" + re_btn_id[3]).text() + "   ");
			$("#re_re_xBtn_" + re_btn_id[2]).html("<img src='cb_detail/image/xBtn.png' style='width: 10px'>");
			$(".re_content_update_" + re_btn_id[2]).append("<input type='hidden' name='cbc_pcno' value='" + re_btn_id[4] + "'>");
			$(".re_content_update_" + re_btn_id[2]).append("<input type='hidden' name='cbc_pcnick' value='"+ 
									"@" + $("#re_name_" + re_btn_id[2] + "_" + re_btn_id[3]).text() + "   " +"'>");
			$("#re_content_" + re_btn_id[2]).focus();
		});
		//<textarea class="form-control" rows="2" id="re_content_${i.index }" name="cbc_content"></textarea>
		$(".re_re_xBtn").click(function() {
			var x_btn_id = $(this).attr("id");
			x_btn_id = x_btn_id.split("_"); //�ε��� 3���� ���̵�з�
			$("#re_re_xBtn_" + x_btn_id[3]).html("");
			$("#re_re_nick_" + x_btn_id[3]).text("");
			$(".re_content_update_" + re_btn_id[2]).html("<textarea class='form-control' rows='2' id='re_content_${i.index }' name='cbc_content'></textarea>");
		});
		
		//<span class="update_rating update_rating_${i.index }" id="update_rating_insert">
		//��� = ������ư ������ ��
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
				starRating_up(up_id[1]);
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
		//���� = ������ư ������ ��
		//<span class="click_ok re_up_btn" id="re_up_btn_${i.index }_${j.index}">�� ��</span>&nbsp;&nbsp;
		/*
		
			<input type="button" class="btn rere_noup_btn" id="rere_noup_${i.index }_${j.index}" value="��&nbsp;&nbsp;&nbsp;��" />
			<input type="submit" class="btn rere_update_btn" id="rere_up_${i.index }_${j.index}" value="��&nbsp;&nbsp;&nbsp;��" />
		*/
		
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
		
		/* $(".del_btn2").click(function() {
			var d_id = $(this).attr("id");
			d_id = d_id.split("_");//�ε��� 1�� ����
			
			$("#delFrm2" + d_id[1]).submit();
		});
		$(".del_btn1").click(function() {
			var d_id = $(this).attr("id");
			d_id = d_id.split("_");//�ε��� 1�� ����
			
			$("#delFrm1" + d_id[1]).submit();
		}); */
		
		$(".del_btn").click(function() {
			var d_id = $(this).attr("id");
			alert("d_id : " + d_id);
			d_id = d_id.split("_");//�ε��� 1�� ����
				
			location.href = "cbcDelete_ok.do?cb_no=" + d_id[1] + "&cbc_no=" + d_id[2];
		});
		
	});
</script>

</head>
<body>
	<div class="review">
		<h2>Review</h2>
		<div class="review_insert">
			<form action="cbc_new_insert.do" method="post">
				<table>
					<!-- ����� ���� & ���� ���� -->
					<tr>
						<td width="10%" class="text-center">
							<div id="board_pro" style="background-image: url('member/profile/${sessionScope.m_profile }')"></div>
							<div class="pro_name">
								<!-- ����� �г��� -->
								<input type="hidden" name="m_email" value="${sessionScope.m_email }">
								<input type="hidden" name="cb_no" value="${vo.cb_no }">
								<input type="hidden" name="review" value="1">
								 ${sessionScope.m_nick }
							</div>
						</td>
						<td width="90%">
							<textarea class="form-control" rows="5" cols="100%" name="cbc_content"></textarea>
						</td>
						
						<!-- ���� & ��ư -->
					</tr>
					
					<tr>
					<td>
						<div class="list_star">
							<!-- �����ֱ� -->
							<span class="cbc_rating" id="cbc_rating_insert">
								  <span class="input">
								    <c:forEach var="i" begin="1" end="10">
										  		<input type="radio" name="cbc_rating" id="r${i }" value="${i/2}">
										  		<label for="r${i }" style="width: ${i*10}px; z-index:${11-i}">${i/2}</label>
								 	</c:forEach>
								 </span>
								 <div class="text-center">
								 	<output for="cbc_rating"><strong>0</strong></output>
								 </div>
					 		</span>
						</div>
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
			<c:forEach var="cbc_vo" items="${cbc_list }" varStatus="i">
				<table class="reviewlist" id="reviewlist_${i.index }">
					<!-- ����� ���� & ���� -->
					<tr>
						<td width="10%" class="text-center user_info">
							<div id="board_pro"  style="background-image: url('member/profile/${cbc_vo.m_profile }')"></div>
							<div class="pro_name">
								<!-- ����� �г��� -->
								<!-- �ӽ÷� �̸��� -->
								${cbc_vo.m_nick }
								<!-- ����г��� -->
							</div>
						</td>
						<td width="90%" class="text-left">
							<div class="review_content">
								<p>
									<!-- �� ���� ���� �ٳ�Դµ���....<br> ������� �ʹ� ģ���ϼ̴µ� �˹ٻ����� �Ŵ��������� �𸣰�����..<br>
									�ʹ� ��ģ���߾��...��� ���� ����ٰ� ��� ����ä�� ���Գ׿�..<br> �˹ٻ��� �ƴϸ� �ʹ�
									������� ���Դϴ�!!! ���� �泲����׿�!!! �����찳��  -->
									${cbc_vo.cbc_content }
								</p>
							</div>
						</td>
					</tr>

					<!-- ���� & ��� ��ư -->
					<tr>
						<td width="10%" class="text-center">
							<div class="star list_star">
								<span class="star-input">
								  <span class="input">
								    <c:forEach var="j" begin="1" end="10">
								    	<input type="radio" name="cbc_rating_${i.index }" id="r${j }" value="${j/2}" 
								    	<c:if test="${(cbc_vo.cbc_rating*2) == j}">checked="checked"</c:if>
								    	<c:if test="${(cbc_vo.cbc_rating*2) != j}">disabled="disabled"</c:if> >
										 <label for="r${j }" style="width: ${j*10}px; z-index:${11-j}">${j/2}</label>
								 	</c:forEach>
								 </span>
					 		</span>
								<h4>${cbc_vo.cbc_rating}<!-- 4.5 --></h4>
							</div>
						</td>
						<td width="90%" class="text-right"><span>
								<!-- �����ϳ�¥ --> ${cbc_vo.dbday }<!-- 2017-12-11 -->&nbsp;&nbsp;&nbsp;
								
								<c:if test="${sessionScope.m_email == cbc_vo.m_email  }">
									<span class="up_btn click_ok" id="up_${i.index }">�� ��</span>&nbsp;&nbsp;
									
									<form action="cbcDelete_ok.do" method="post" id="delFrm1">
										<input type="hidden" name="del_cbc_no" value="${cbc_vo.cbc_no}">
										<input type="hidden" name="cb_no" value="${vo.cb_no}">
										<span class="del_btn click_ok" id="del_${vo.cb_no}_${cbc_vo.cbc_no }">�� ��</span>&nbsp;&nbsp;
									</form>
								</c:if>
								
						</span> <button class="btn reply_btn" id="reply_btn_${i.index }">��&nbsp;&nbsp;&nbsp;��</button></td>
					</tr>
				</table>
				
				<!-- --------------------------------------------------------------------- ���� -->
				<div class="review_update" id="review_up_${i.index }">
					<form action="cbc_update.do" method="post">
						<table>
							<!-- ����� ���� & ���� ���� -->
							<tr>
								<td width="10%" class="text-center">
									<div id="board_pro" style="background-image: url('member/profile/${sessionScope.m_profile }')"></div>
									<div class="pro_name">
										<!-- ����� �г��� -->
										<input type="hidden" name="m_email" value="${sessionScope.m_email }">
										<input type="hidden" name="cb_no" value="${vo.cb_no }">
										<input type="hidden" name="cbc_no" value="${cbc_vo.cbc_no }">
										<input type="hidden" name="review" value="1">
										 ${sessionScope.m_nick }
									</div>
								</td>
								<td width="90%">
									<textarea class="form-control" rows="5" cols="100%" name="cbc_content">${cbc_vo.cbc_content }</textarea>
								</td>
								
								<!-- ���� & ��ư -->
							</tr>
							
							<tr>
							<td>
								<div class="list_star">
									<!-- �����ֱ�  id="update_rating_insert"-->
									<span class="update_rating update_rating_${i.index }" id="update_rating_insert${i.index }">
											<!-- class="input"  => ������� Ȱ��ȭ-->
										  <span id="input_${i.index }">
										    <c:forEach var="k" begin="1" end="10">
												  		<input type="radio" name="update_rating_${cbc_vo.cbc_no}" id="u${i.index }${k }" value="${k/2}"
												  		<c:if test="${(cbc_vo.cbc_rating*2) == k}">checked="checked"</c:if>>
												  		<label for="u${i.index }${k }" style="width: ${k*10}px; z-index:${11-k}">${k/2}</label>
										 	</c:forEach>
										 </span>
										 <div class="text-center">
										 	<output for="update_rating_${cbc_vo.cbc_no}"><strong id="strong_${i.index }">${cbc_vo.cbc_rating }</strong></output>
										 </div>
							 		</span>
								</div>
							</td>
							<td class="text-right">
								<div class="star_insert">
								<input type="button" class="btn re_noupdate_btn" id="no_up_${i.index }"
										value="��&nbsp;&nbsp;&nbsp;&nbsp;��"/>
									<input type="submit" class="btn re_update_btn" id="up_${i.index }"
										value="��&nbsp;&nbsp;&nbsp;&nbsp;��" />
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
						<c:if test="${cvo.cbc_group_id==cbc_vo.cbc_group_id }">
							<table class="reply_list" id="replylist_${i.index }_${j.index}">
								<!-- ����� ���� & ���� -->
								<tr>
									<td widht="3%" class="reply_tab"></td>
									<td rowspan="2" width="100px"
										class="text-center user_info reply_user">
										<div id="reply_pro" style="background-image: url('cb_detail/image/pro.png')"></div>
										<div class="reply_name" id="re_name_${i.index }_${j.index }"><!-- ����г��� -->${cvo.m_nick }</div>
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
									<td width="87%" class="text-right">
										<span>
											<!-- �����ϳ�¥ --><!-- 2017-12-15 -->${cvo.dbday }&nbsp;&nbsp;&nbsp;
										</span> 
										<c:if test="${sessionScope.m_email == cvo.m_email  }">
											<span class="click_ok re_up_btn" id="re_up_btn_${i.index }_${j.index}">�� ��</span>&nbsp;&nbsp;
											
											<span class="click_ok del_btn" id="del_${vo.cb_no}_${cvo.cbc_no }">�� ��</span>&nbsp;&nbsp;
												
										</c:if>
										<button class="btn re_reply_btn"  id="re_btn_${i.index }_${j.index }_${cvo.cbc_no}">��&nbsp;&nbsp;&nbsp;��</button>
									</td>
								</tr>
							</table>
						</c:if>
						<!-- ���� ����-------------------------------------------------------------------------------------------------- -->
						<div class="reply_update" id="reply_up_${i.index }_${j.index}">
							<form action="re_reply_update.do" method="post">
								<table class="reply_insert">
									<!-- ����� ���� & ���� -->
									<tr>
										<td widht="3%" class="reply_tab"></td>
										<td rowspan="2" width="100px"
											class="text-center user_info reply_user">
											<div id="reply_pro"  style="background-image: url('member/profile/${sessionScope.m_profile }')"></div>
											<div class="reply_name"><!-- ����� �г��� -->
												<input type="hidden" name="m_email" value="${sessionScope.m_email }">
												<input type="hidden" name="cb_no" value="${vo.cb_no }">
												<input type="hidden" name="cbc_no" value="${cvo.cbc_no }">
												<input type="hidden" name="review" value="1">
												${sessionScope.m_nick }
											</div>
											
										</td>
										<td width="87%" class="text-left reply_content_td">
											<div class="re_re_pname" id="re_re_pname_${i.index }">
												<span id="re_reup_nick_${i.index }" ></span>
												<a id="re_re_xBtnup_${i.index }" class="re_re_xBtn"></a>
											</div>
											<div class="re_content_insert">
												<textarea class="form-control" rows="2" id="rere_content_${i.index }" name="cbc_content">${cvo.cbc_content }</textarea>
											</div>
										</td>
									</tr>
			
									<!-- ���� & ��� ��ư -->
									<tr>
										<td colspan="2"></td>
										<td width="87%" class="text-right">
											<input type="button" class="btn rere_noup_btn" id="rere_noup_${i.index }_${j.index}" value="��&nbsp;&nbsp;&nbsp;��" />
											<input type="submit" class="btn rere_update_btn" id="rere_up_${i.index }_${j.index}" value="��&nbsp;&nbsp;&nbsp;��" />
										</td>
									</tr>
								</table>
							</form>
						</div>
						<!--���ۼ��� --------------------------------------------------------------------------------------------------------- -->
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
									<div id="reply_pro"  style="background-image: url('member/profile/${sessionScope.m_profile }')"></div>
									<div class="reply_name"><!-- ����� �г��� -->
										<input type="hidden" name="m_email" value="${sessionScope.m_email }">
										<input type="hidden" name="cb_no" value="${vo.cb_no }">
										<input type="hidden" name="cbc_pno" value="${cbc_vo.cbc_no }">
										<input type="hidden" name="review" value="1">
										${sessionScope.m_nick }
									</div>
									
								</td>
								<td width="87%" class="text-left reply_content_td">
									<div class="re_re_pname" id="re_re_pname_${i.index }">
										<span id="re_re_nick_${i.index }" ></span>
										<a id="re_re_xBtn_${i.index }" class="re_re_xBtn"></a>
									</div>
									<div class="re_content_update_${i.index }">
										<textarea class="form-control" rows="2" id="re_content_${i.index }" name="cbc_content"></textarea>
									</div>
								</td>
							</tr>
	
							<!-- ���� & ��� ��ư -->
							<tr>
								<td colspan="2"></td>
								<td width="87%" class="text-right">
									<input type="submit" class="btn reply_insert_btn" value="��&nbsp;&nbsp;&nbsp;��" />
								</td>
							</tr>
						</table>
					</form>
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