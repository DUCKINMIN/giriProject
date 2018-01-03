<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYPAGE</title>
<style type="text/css">
	.myInfo{
		margin: 0px auto;
	}
	.myMenu{
		border-bottom: 1px solid #262626;
	}
	.myBtn{
		background-color: white;
		border-bottom: 0px; 
		border-top: 1px solid #262626;
		border-left: 1px solid #262626;
		border-right: 1px solid #262626;
		border-radius: 0px;
	}
	.info_input{
		height: 70px; 
		padding-left: 20px;
		padding-right: 20px;
		font-size: medium;
	}
	.info_btn{
		background-color: rgb(162,0,0);
		color: white;
		height: 35px;
		width: 70px;
	}
	.mytable{
		border-bottom: 1px solid lightgray; 
	}
	#myprofile{
		border-radius: 50%;
	}
	@media screen and (min-width: 769px) {
		.menurow{
			margin: 0px auto;
			width: 80%;
		}
		.mypagerow{
			margin: 0px auto;
			width: 80%;
		}
		.myInfo{
			width: 60%;
			height: 200px;
		}
		#myprofile{
			width: 170px; 
			height: 170px; 
		}
		.mytable{
			height: 170px;
		}
	}
	@media screen and (max-width: 770px) {
		.menurow{
			margin: 0px auto;
			width: 100%:
		}
		.mypagerow{
			margin: 0px auto;
			width: 100%;
		}
		.myInfo{
			width: 100%;
			height: 150px;
		}
		#myprofile{
			width:100px;
			height:100px;
		}
		.mytable{
			height: 120px;
		}
	}
</style>
<script type="text/javascript">
<c:if test="${sessionScope.m_email==null}">
	location.href="index.jsp";
	alert("로그인 후 이용해주세요");
</c:if>
$(function(){	
	$('[data-toggle="popover"]').popover({container: "body"});
	$("#myboard").click(function(){
		$("#myboard").css({
			"color": "white", "background-color": "#262626"
		});
	});
	// 모달닫기
	$(".closeupdate").click(function(){
		$("#infoupdatecon").html("");
		$("#").val("");
		$("#").val("");
		$('#infoUpdateModal').modal('hide');
	});
	/* // 메뉴
	$("#myinfo").click(function(){
		$("#myboard").css({
			"color": "black", "background-color": "white"
		});
		$("#myevent").css({
			"color": "black", "background-color": "white"
		});
		$("#myinfo").css({
			"color": "white", "background-color": "#262626"
		});
	});	 */	
});
</script>
</head>
<body>
	<div style="height: 30px"></div>
	<div class="container">
		<div class="row myInfo">
			<table class="table mytable">
				<tr>
					<td width="30%" class="text-center" rowspan="3" valign="middle">
						<span id="userimage">
							<img id="myprofile" alt="${sessionScope.m_profile }" src="member/profile/${sessionScope.m_profile }">
						</span>
					</td>
				</tr>
				<!-- <tr>
					<td width="50%" class="text-right" >
						<a href="#infoUpdateModal" data-toggle="modal">
							<img alt="수정" src="member/image/setting.png" width="15px" data-container="body"
							 data-toggle="popover" data-placement="left" data-content="프로필 수정" data-trigger="hover">
						</a>
					</td>
				</tr> -->
				<tr>
					<td width="20%" class="text-right">
						<label>닉네임</label>
					</td>
					<td width="50%" class="text-center">
						<label>${sessionScope.m_nick }</label>
					</td>
				</tr>
				<tr>
					<td width="20%" class="text-right">
						<label>성별</label>
					</td>
					<td width="50%" class="text-center">
						<label>${sessionScope.m_sex }</label>
					</td>
				</tr>
			</table>
		</div>
		<div class="row menurow">
			<div style="height: 5px"></div>
			<div class="myMenu text-left">
				<span><a href="mypage.do" class="btn myBtn" id="myboard">나의활동</a></span> 
				<span><a href="myevent.do" class="btn myBtn" id="myevent">이벤트</a></span> 
				<span><a href="myinfo.do" class="btn myBtn" id="myinfo">수정/탈퇴</a></span> 
				<c:if test="${sessionScope.m_grade==1 }">
				<span><a href="member_event.do" class="btn myBtn" id="myinfo">이벤트 관리</a></span>
			 	</c:if>
			</div>
		</div>
		<div class="row mypagerow">
			<jsp:include page="${member_jsp }"/>
		</div>
	</div>
	<div style="height: 30px"></div>
</body>
</html>