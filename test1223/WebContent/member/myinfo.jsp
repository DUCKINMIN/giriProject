<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYINFO</title>
<style type="text/css">
	.result_div{
		height: 70px;
	}
	.result_input{
		height: 50px; 
		padding-left: 20px;
		padding-right: 20px;
		font-size: medium;
	}
	#tel_btn, #pwd{
		background-color: rgb(162,0,0);
		color: white;
		height: 30px;
		
	}
	.result_btn{
		background-color: rgb(162,0,0);
		color: white;
		height: 50px;
		width: 75px;
	}
	#nick_check{
		background-color: rgb(162,0,0);
		color: white;
		height: 50px;
	}
	@media screen and (min-width: 769px) {
		.mypagerow{
			margin: 0px auto;
			width: 50%;
		}
	}
	@media screen and (max-width: 770px) {
		.result_div{
			margin: 0px auto;
			width: 350px;
			text-align: center;
		}
	}
</style>
<script type="text/javascript">
$(function(){
	var nickcount = 1;
	$("#updateBtn").click(function(){
		$('#nickcon').html("");
		var nick = $("#nick").val();
		var mynick = $("#mynick").val();
		if(nick.trim()==""){
			$('#nickcon').html("<font color=red>닉네임을 입력해주세요</font>");
			$("#nick").focus();
			return;
		}
		if (mynick==nick||nickcount==0) {
			$.ajax({
				type :"post",
				url : "myNickCheck.do", 
				data : {"nick" : nick,"mynick":mynick},
				success : function(data) {
					var count = data.trim();
					if (count != 0) {
						$('#nickcon').html("<font color=red>닉네임 중복확인을 해주세요</font>");
						$('#nick').focus();
					} else {
						$("form").submit();
					}
				}
			});
		} else if(nickcount!=0) {
			$('#nickcon').html("<font color=red>닉네임 중복확인을 해주세요</font>");
			$('#nick').focus();
		} 	
	});	
	
	// 닉네임 중복체크
	$('#nick_check').click(function(){
		var nick = $("#nick").val();
		var mynick = $("#mynick").val();
		if(nick.trim()==""){
			$('#nickcon').html("<font color=red>닉네임을 입력해주세요</font>");	
			$("#nick").focus();
			return;
		}
		$.ajax({
			type : "post",
			url : "myNickCheck.do", 
			data : {"nick" : nick,"mynick":mynick},
			success : function(data) {
				nickcount = data.trim();
				if (nickcount == 0) {
					$('#nickcon').html("<font color=blue>"+nick+"은(는) 사용 가능한 닉네임입니다</font>"); 
				} else {
					$('#nickcon').html("<font color=red>"+nick+"은(는) 이미 사용중인 닉네임입니다</font>"); 
					$('#nick').val("");
					$('#nick').focus();
				}
			}
		});
	});
	
	//모달
	$(".closepwd").click(function(){
		//$("#pwdupdatecon").html("");
		$("#cur_pwd").val("");
		$("#change_pwd").val("");
		$("#check_pwd").val("");
		$('#pwdUpdateModal').modal('hide');
	});
	$(".closetel").click(function(){
		//$("#telupdatecon").html("");
		$("#name").val("");
		$("#tel").val("");
		$('#telUpdateModal').modal('hide');
	});
});
$(function() {
    $("#profile").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#myimg').attr('src', e.target.result);
        }
      	reader.readAsDataURL(input.files[0]);
    }
}
</script>
</head>
<body>
	<div>
		<h4><img alt="like" src="member/image/user.png" width="25px">&nbsp; 개인정보</h4>
	</div>
	<div class="text-right">
		<a href="#"><font color="red">※회원탈퇴※</font></a>
	</div>			
	<form method="post" action="myinfo_update.do" enctype="multipart/form-data">
		<div class="text-center"> 
			<label>프로필 사진</label>
		</div>
		<div style="width: 200px; margin: 0px auto;">
				<div style="border: 1px none; width: 200px; height: 200px;" >
					<img id="myimg" alt="${vo.m_profile }" src="/project/member/profile/${vo.m_profile }" style="width: 200px; height: 200px; border-radius: 50%"/>
				</div>
				<div class="text-right" style="height: 50px">
					<input type="hidden" readonly="readonly" id="change">
					<label style="cursor: pointer;">프로필 사진 수정
					<input type='file' id="profile" name="profile" onchange="javascript:$('#change').value=this.value" style="display:none;" accept='image/*'/>
					</label>
				</div>
				</div>
		<div class="result_div">
			<input type="text" class="result_input form-control" value="${vo.m_email }" readonly/>
			<input type="hidden" value="${vo.m_email }" name="email">
			<input type="hidden" value="${vo.m_grade }" name="grade">
		</div>
		<div class="text-center">
			<label>이메일</label>
		</div>
		<div class="result_div">
			<input type="text" class="result_input form-control" value="${vo.m_email }" readonly/>
		</div>
		<div class="text-center">
			<label>이름</label>
		</div>
		<div class="result_div">
			<input type="text" class="result_input form-control" value="${vo.m_name }" readonly/>
		</div>
		<div class="text-center">
			<label>닉네임</label>
		</div>
		<div class="result_div" >
			<input type="text" id="nick" name="nick" class="result_input col-xs-8" value="${vo.m_nick }" />
			<input type="button" id="nick_check" class="btn col-xs-4" value="중복체크">
			<input type="hidden" id="mynick" name="mynick" value="${sessionScope.m_nick}">
		</div>
		<div id="nickcon" class="text-left"></div>
		<div class="text-center">
			<label>생년월일</label>
		</div>
		<div class="result_div">
			<input type="date" class="result_input form-control" value="${vo.m_birth }" readonly/>
		</div>
		<div class="text-center">
			<label>사업자 등록 번호</label>
		</div>
		<c:if test="${vo.m_grade=='1' }">
		<div class="result_div">
			<input type="text" class="result_input form-control" value="없음" readonly/>
		</div>
		</c:if>
		<c:if test="${vo.m_grade=='2' }">
		<div class="result_div">
			<input type="text" id="companyno" name="companyno" class="result_input form-control" value=${vo.m_companyno } maxlength="10"/>
		</div>
		</c:if>
		<div class="text-center">
			<label>가입날짜</label>
		</div>
		<div class="result_div">
			<input type="text" class="result_input form-control" value='<fmt:formatDate value="${vo.m_regdate }" pattern="yyyy-MM-dd" />' readonly/>
		</div>
		<div class="result_div text-right">
			<input type="button" id="pwd" value="비밀번호 변경" class="btn" data-target="#pwdUpdateModal" data-toggle="modal"/>
			<input type="button" id="tel_btn" value="핸드폰번호 변경" class="btn" data-target="#telUpdateModal" data-toggle="modal">
		</div>
		<div class="result_div text-center">
			<input type="button" value="수정" class="btn result_btn" id="updateBtn" >&nbsp;
			<input type="button" value="취소" class="btn result_btn" onclick="javascript:history.back()">
		</div>
	</form>	
	<!-- 비밀번호 수정 -->
	<div class="modal fade" id="pwdUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" 
    data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-sm">
        	<div class="modal-content">
            	<div class="modal-header">
                	<button type="button" class="close closebtn" onclick="javascript:close()">
                    	<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">비밀번호 수정</h3>
                </div>
            	<div class="modal-body">
            		<div class="info_input">
            			현재 비밀번호 <input type="text" id="cur_pwd" class="form-control">
            		</div>
            		<div class="info_input">
            			변경할 비밀번호 <input type="text" id="change_pwd" name="change_pwd"class="form-control">
            		</div>
            		<div class="info_input">
            			비밀번호 확인 <input type="text" id="check_pwd" class="form-control">
            		</div>
            		
            		<div class="info_input text-center">
            			<input type="button" value="수정" class="btn info_btn" id="pwdChangeBtn">
            			<input type="button" value="취소" class="btn info_btn closepwd">
            		</div>
            	</div>
        	</div>
    	</div>
	</div>	
	<!-- 핸드폰번호 수정 -->
	<div class="modal fade" id="telUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" 
    data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-sm">
        	<div class="modal-content">
            	<div class="modal-header">
                	<button type="button" class="close closebtn" onclick="javascript:close()">
                    	<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">핸드폰번호 수정</h3>
                </div>
            	<div class="modal-body">
            		<div class="info_input" >
            			핸드폰번호 <input type="text" class="form-control" value="${vo.m_tel }">
            		</div>
       				<div class="text-right" style="height: 50px; margin-right: 20px;">
       					<input type="button" value="인증번호 전송" width="150px" class="btn info_btn" style="width: 100px">
       				</div>
            		<div class="info_input">
            			인증번호 입력<input type="text" class="form-control">
            		</div>
            		<div class="info_input text-center">
            			<input type="button" value="수정" class="btn info_btn" id="telChangeBtn">
            			<input type="button" value="취소" class="btn info_btn closetel">
            		</div>
            	</div>
        	</div>
    	</div>
	</div>
</body>
</html>