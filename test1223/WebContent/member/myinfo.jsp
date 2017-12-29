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
		$('#gradecon').html("");
		var nick = $("#nick").val();
		var mynick = $("#mynick").val();
		var grade = $("#grade").val();
		if(nick.trim()==""){
			$('#nickcon').html("<font color=red>닉네임을 입력해주세요</font>");
			$("#nick").focus();
			return;
		}
		if(grade==2){
			var companyno = $("#companyno").val();
			if (companyno.trim()=="") {
				$('#gradecon').html("<font color=red>사업자 등록번호를 입력해주세요</font>");
				$("#companyno").focus();
				return;
			}
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
						var answer = confirm ("회원정보를 수정하시겠습니까?");
						if (answer) {
							$("#infofrm").submit();
							alert("수정되었습니다");
						} else {
							return;
						}
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

	// pwd수정
	$("#pwdChangeBtn").click(function(){
		$("#pwdcon").html("");
		var mypwd = ${sessionScope.m_pwd };
		var curpwd = $("#curpwd").val();
		var changepwd = $("#changepwd").val();
		var checkpwd = $("#checkpwd").val();
		
		if (curpwd.trim()=="") {
			$("#pwdcon").html("<font color=red>현재 비밀번호를 입력해주세요</font>");	
			$("#curpwd").focus();
			return;
		}
		if (changepwd.trim()=="") {
			$("#pwdcon").html("<font color=red>변경할 비밀번호를 입력해주세요</font>");	
			$("#changepwd").focus();
			return;
		}
		if (checkpwd.trim()=="") {
			$("#pwdcon").html("<font color=red>변경할 비밀번호를 한번더 입력해주세요</font>");	
			$("#checkpwd").focus();
			return;
		}
		if (mypwd!=curpwd) {
			$("#pwdcon").html("<font color=red>현재 비밀번호가 일치하지 않습니다</font>");
			return;
		}
		if(changepwd.trim()!=checkpwd.trim()){
			$("#pwdcon").html("<font color=red>변경할 비밀번호가 일치하지 않습니다</font>");
			return;
		}
		var answer = confirm ("비밀번호를 수정하시겠습니까?");
		if (answer) {
			$("#pwdfrm").submit();
			alert("수정되었습니다");
		} else {
			return;
		}
	});
	
	// 핸드폰번호 체크
	var checkno;
	$("#telBtn").click(function(){
		$('#telcon').html("");
		var number = $("#tel").val();
		if (number.trim()=="") {
			$('#telcon').html("<font color=red>핸드폰번호를 입력해주세요</font>");
			$(".telcheck").hide(500);
			$("#tel").focus();
		} else if(number.trim().length < 11){
			$('#telcon').html("<font color=red>핸드폰번호를 정확하게 입력해주세요</font>");
			$(".telcheck").hide(500);			
			$("#tel").focus();
		} else if(number.trim().length == 11){
			$(".telcheck").show(500);
			$('#telcon').html("<font color=blue>인증번호를 전송했습니다 인증번호를 입력해주세요</font>");
			$("#telcheck").focus();
			$.ajax({
				type:"post",
				url:"telCheck.do",
				success:function(data){
					checkno = data.trim();
					alert(checkno);
				}
			});
		}
	});
	// 인증번호 일치여부
	$("#telcheckBtn").click(function(){
		var userno = $("#userno").val();
		if(userno!=checkno){
			$('#telcon').html("<font color=red>인증번호가 일치하지않습니다</font>");
			$("#userno").focus();
		} else {
			$('#telcon').html("<font color=blue>인증번호 일치</font>");
		}
	});
	
	$("#telChangeBtn").click(function(){
		var userno = $("#userno").val();
		if (userno.trim()=="") {
			$('#telcon').html("<font color=red>핸드폰 인증이 필요합니다</font>");
			$("#tel").focus();
			return;
		} else if(checkno!=userno){
			$('#telcon').html("<font color=red>인증번호가 일치하지않습니다</font>");
			$("#userno").focus();
			return;
		}
		var answer = confirm ("핸드폰번호를 수정하시겠습니까?");
		if (answer) {
			$("#telfrm").submit();
			alert("수정되었습니다");
		} else {
			return;
		}
	});
	
	$("#deleteBtn").click(function(){
		$("#deletecon").html("");
		var pwd = $("#deletepwd").val();
		var mypwd = ${sessionScope.m_pwd};
		alert(mypwd+","+pwd)
		if (pwd.trim()=="") {
			$('#deletecon').html("<font color=red>비밀번호를 입력해주세요</font>");
			$("#deletepwd").focus();
			return;
		} else if(pwd!=mypwd){
			$('#deletecon').html("<font color=red>비밀번호가 일치하지않습니다</font>");
			$("#deletepwd").focus();
			return;
		}
		var answer = confirm ("정말 탈퇴하시겠습니까? 탈퇴 후 모든정보는 되돌릴수 없습니다");
		if (answer) {
			$("#deletefrm").submit();
			alert("탈퇴되었습니다");
		} else {
			return;
		}
	});
	
	
	// 모달
	$(".closepwd").click(function(){
		$("#curpwd").val("");
		$("#changepwd").val("");
		$("#checkpwd").val("");
		$("#pwdcon").html("");
		$('#pwdUpdateModal').modal('hide');
	});
	$(".closetel").click(function(){
		$("#tel").val("${vo.m_tel }");
		$("#telcheck").val("");
		$('#telcon').html("");
		$(".telcheck").hide();
		$('#telUpdateModal').modal('hide');
	});
	$(".closedelete").click(function(){
		$("#deletepwd").val("");
		$('#deletecon').html("");
		$('#memberDeleteModal').modal('hide');
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
		<a href="#memberDeleteModal" data-toggle="modal"><font color="red">※회원탈퇴※</font></a>
	</div>			
	<form method="post" action="myinfo_update.do" enctype="multipart/form-data" id="infofrm">
		<div class="text-center"> 
			<label>프로필 사진</label>
		</div>
		<div style="width: 200px; margin: 0px auto;">
				<div style="border: 1px none; width: 200px; height: 200px;" >
					<img id="myimg" alt="${vo.m_profile }" src="member/profile/${vo.m_profile }" style="width: 200px; height: 200px; border-radius: 50%"/>
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
			<input type="hidden" value="${vo.m_grade }" name="grade" id="grade">
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
		<div class="result_div">
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
			<input type="text" class="result_input form-control" value="-" readonly/>
		</div>
		</c:if>
		<c:if test="${vo.m_grade=='2' }">
		<div class="result_div">
			<input type="text" id="companyno" name="companyno" class="result_input form-control" value=${vo.m_companyno } maxlength="10"/>
		</div>
		</c:if>
		<div id="gradecon" class="text-left"></div>
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
            			현재 비밀번호 <input type="text" id="curpwd" class="form-control">
            		</div>
            		<form method="post" action="pwd_update.do" id="pwdfrm">
					<div class="info_input">
            			변경할 비밀번호 <input type="text" id="changepwd" name="changepwd" class="form-control">
            		</div>
            		</form>
            		<div class="info_input">
            			비밀번호 확인 <input type="text" id="checkpwd" class="form-control">
            		</div>
            		<div id="pwdcon" class="text-left" style="margin-left: 20px;"></div>
            		<br>
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
            		<form method="post" action="tel_update.do" id="telfrm">
            		<div class="info_input" >
            			핸드폰번호 <input type="text" class="form-control" value="${vo.m_tel }" id="tel" name="tel" maxlength="11">
            		</div>
            		</form>
       				<div class="text-right" style="height: 50px; margin-right: 20px;">
       					<input type="button" value="인증번호 전송" class="btn info_btn" id="telBtn" style="width: 110px">
       				</div>
            		<div class="info_input telcheck" style="display: none;">
            			인증번호 입력<input type="text" class="form-control" id="userno" maxlength="5">
            		</div>
            		<div class="text-right telcheck" style="height: 50px; margin-right: 20px; display: none;">
       					<input type="button" value="확인" class="btn info_btn" id="telcheckBtn" style="width: 110px">
       				</div>
            		<div id="telcon" class="text-left" style="margin-left: 20px;"></div>
            		<div class="info_input text-center">
            			<input type="button" value="수정" class="btn info_btn" id="telChangeBtn">
            			<input type="button" value="취소" class="btn info_btn closetel">
            		</div>
            	</div>
        	</div>
    	</div>
	</div>
	<!-- 회원탈퇴 -->
	<div class="modal fade" id="memberDeleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" 
    data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-sm">
        	<div class="modal-content">
            	<div class="modal-header">
                	<button type="button" class="close closebtn" onclick="javascript:close()">
                    	<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">회원 탈퇴</h3>
                </div>
            	<div class="modal-body">
            		<div class="info_input">
            			탈퇴를 하시려면 비밀번호를 입력해주세요
            		</div>
            		<form method="post" action="member_delete.do" id="deletefrm">
					<div class="info_input">
            			비밀번호 <input type="text" id="deletepwd" class="form-control">
            		</div>
            		</form>
            		<div id="deletecon" class="text-left" style="margin-left: 20px;"></div>
            		<br>
            		<div class="info_input text-center">
            			<input type="button" value="탈퇴" class="btn info_btn" id="deleteBtn">
            			<input type="button" value="취소" class="btn info_btn closedelete">
            		</div>
            		
            	</div>
        	</div>
    	</div>
	</div>	
</body>
</html>