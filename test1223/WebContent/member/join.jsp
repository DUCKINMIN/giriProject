<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>JOIN</title>
<style type="text/css">
	.joinrow{
		margin: 0px auto;
	}
	.result_div{
		height: 90px;
	}
	.result_input{
		height: 70px; 
		padding-left: 20px;
		padding-right: 20px;
		font-size: medium;
	}
	#tel_btn, #email_check, #nick_check, #telcheck_btn{
		background-color: rgb(162,0,0);
		color: white;
		height: 70px;
	}
	#gender, #gender2{
		height: 50px;
		background-color: white;
		border: 1px solid gray;
	}
	.result_btn{
		background-color: rgb(162,0,0);
		color: white;
		height: 70px;
		width: 75px;
	}
	.checkbox-wrap { cursor: pointer; }
	.checkbox-wrap .check-icon  { display: inline-block; width: 50px; height: 50px; background: url(member/image/nonecheck.png) left center no-repeat; vertical-align: middle; transition-duration: .3s; }
	.checkbox-wrap input[type=radio] { display: none; }
	.checkbox-wrap input[type=radio]:checked + .check-icon { background-image: url(member/image/check.png); }
	
	@media screen and (min-width: 769px) {
		.joinrow{
			margin: 0px auto;
			width: 60%;
		}
	}
	@media screen and (max-width: 750px) {
		.joinrow{
			margin: 0px auto;
			width: 100%;
		}
		.result_div{
			margin: 0px auto;
			width: 350px;
			text-align: center;
		}
	}
</style>
<script type="text/javascript">
$(function(){	
	var emailtest = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; // �̸��� ���Խ�
	var phonetest =/(01[016789])([1-9]{1}[0-9]{2,3})([0-9]{4})$/; // �ڵ�����ȣ ���Խ�
	//var pwdtest = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}/; //��й�ȣ ���Խ�
	
	var checkno;
	var emailcount;
	var nickcount = 1;
	// ȸ������
	$('#joinBtn').click(function(){
		$('#emailcon').html("");
		$('#pwdcon').html("");
		$('#namecon').html("");
		$('#nickcon').html("");
		$('#birthcon').html("");
		$('#gradecon').html("");
		$('#telcon').html("");
		var email = $("#email").val();
		var nick = $("#nick").val();
		var pwd = $("#pwd").val();
		var pwdcheck = $("#pwd_check").val();
		var userno = $("#telcheck").val();
		var name = $("#name").val();
		var birth = $("#birth").val();
		var ceo = $("#ceo").prop("checked");
		// �ڵ�������
		if (userno.trim()=="") {
			$('#telcon').html("<font color=red>�ڵ��� ������ �ʿ��մϴ�</font>");
			$("#tel").focus();
			return;
		} else if(checkno!=userno){
			$('#telcon').html("<font color=red>������ȣ�� ��ġ�����ʽ��ϴ�</font>");
			$("#telcheck").focus();
			return;
		} 
		// �̸���
		if(email.trim()==""){
			$('#emailcon').html("<font color=red>�̸����� �Է����ּ���</font>");
			$('#email').focus();
			return;
		} else if(emailcount != 0){
			$('#emailcon').html("<font color=red>�̸��� �ߺ�Ȯ���� ���ּ���</font>");
			$('#email').focus();
			return;
		} else if(pwd.trim()==""){	//���
			$('#pwdcon').html("<font color=red>��й�ȣ�� �Է����ּ���</font>");
			$('#pwd').focus();
			return;
		} /* else if(pwdtest.test(pwd)==false){
			$('#pwdcon').html("<font color=red>��й�ȣ�� �ּ�8��,����,���ڰ� �ϳ��̻� ���ԵǾ�� �մϴ�</font>");
			$('#pwd').focus();
			return;
		}  */
			else if(pwd!=pwdcheck){
			$('#pwdcon').html("<font color=red>��й�ȣ�� ��ġ���� �ʽ��ϴ�</font>");
			$("#pwd").focus();
			return;
		} else if(name.trim()==""){	//�̸�
			$('#namecon').html("<font color=red>�̸��� �Է����ּ���</font>");
			$("#name").focus();
			return;
		} else if (nick.trim()=="") { //�г���
			$('#nickcon').html("<font color=red>�г����� �Է����ּ���</font>");
			$("#nick").focus();
			return;
		} else if(nickcount!=0) {
			$('#nickcon').html("<font color=red>�г��� �ߺ�Ȯ���� ���ּ���</font>");
			$('#nick').focus();
			return;
		} else if (birth.trim()=="") { //����
			$('#birthcon').html("<font color=red>��������� �Է����ּ���</font>");
			$("#birth").focus();
			return;
		} else if(ceo==true){ //����
			var companyno = $("#companyno").val();
			if(companyno.trim()==""){
				$('#gradecon').html("<font color=red>����ڹ�ȣ�� �Է����ּ���</font>");
				companyno.focus();
				return;
			}
		}
		$.ajax({
			type : "post",
			url : "emailCheck.do", 
			data : {"email" : email},
			success : function(data) {
				var count = data.trim();
				if (count != 0) {
					$('#emailcon').html("<font color=red>�̸��� �ߺ�Ȯ���� ���ּ���</font>");
					$('#email').focus();
				} else {
					$.ajax({
						type : "post",
						url : "nickCheck.do", 
						data : {"nick" : nick},
						success : function(data) {
							var count = data.trim();
							if (count != 0) {
								$('#nickcon').html("<font color=red>�г��� �ߺ�Ȯ���� ���ּ���</font>");
								$('#nick').focus();
							} else {
								$("form").submit();
							}
						}
					});
				}
			}
		});
	});
	
	// �ڵ�����ȣ üũ
	$("#tel_btn").click(function(){
		$('#telcon').html("");
		var number = $("#tel").val();
		if (number.trim()=="") {
			$('#telcon').html("<font color=red>�ڵ�����ȣ�� �Է����ּ���</font>");
			$(".telcheck").hide(500);
		} else if(number.trim().length < 11 || phonetest.test(number)==false){
			$('#telcon').html("<font color=red>�ڵ�����ȣ�� ��Ȯ�ϰ� �Է����ּ���</font>");
			$(".telcheck").hide(500);			
		} else if(number.trim().length == 11 && phonetest.test(number)==true){
			$(".telcheck").show(500);
			$('#telcon').html("<font color=blue>������ȣ�� �����߽��ϴ� ������ȣ�� �Է����ּ���</font>");
			
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
	
	// ������ȣ ��ġ����
	$("#telcheck_btn").click(function(){
		var userno = $("#telcheck").val();
		if(userno!=checkno){
			$('#telcon').html("<font color=red>������ȣ�� ��ġ�����ʽ��ϴ�</font>");
		} else {
			$('#telcon').html("<font color=blue>������ȣ ��ġ</font>");
		}
	});
	
	// �̸��� �ߺ�üũ
	$('#email_check').click(function(){
		var email = $("#email").val();
		if(email.trim()==""){
			$('#emailcon').html("<font color=red>�̸����� �Է����ּ���</font>");	
			$("#email").focus();
		} else if(emailtest.test(email) == false){
			$('#emailcon').html("<font color=red>�̸��� ������ �ùٸ��� �ʽ��ϴ�</font>");	
			$("#email").focus();
		} else {
			$.ajax({
				type : "post",
				url : "emailCheck.do", 
				data : {"email" : email},
				success : function(data) {
					emailcount = data.trim();
					if (emailcount == 0) {
						$('#emailcon').html("<font color=blue>"+email+"��(��) ��� ������ ���̵��Դϴ�</font>");
					} else {
						$('#emailcon').html("<font color=red>"+email+"��(��) �̹� ������� ���̵��Դϴ�</font>");
						$('#email').val("");
						$('#email').focus();
					}
				}
			});
		}
	});
	
	// �г��� �ߺ�üũ
	$('#nick_check').click(function(){
		var nick = $("#nick").val();
		if(nick.trim()==""){
			$('#nickcon').html("<font color=red>�г����� �Է����ּ���</font>");	
			$("#nick").focus();
			return;
		}
		$.ajax({
			type : "post",
			url : "nickCheck.do", 
			data : {"nick" : nick},
			success : function(data) {
				nickcount = data.trim();
				if (nickcount == 0) {
					$('#nickcon').html("<font color=blue>"+nick+"��(��) ��� ������ �г����Դϴ�</font>"); 
				} else {
					$('#nickcon').html("<font color=red>"+nick+"��(��) �̹� ������� �г����Դϴ�</font>"); 
					$('#nick').val("");
					$('#nick').focus();
				}
			}
		});
	});
	
	// ����ڵ�Ϲ�ȣ Ȯ��
	$("#user").click(function(){
		$("#companyno").val("");
		$("#grade").hide(500);
		$("#gradecon").html("");
	});
	$("#ceo").click(function(){
		$("#grade").show(500);
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
	<div class="container">
		<div class="row joinrow text-center">
			<div style="height: 50px"></div>
			<div style="height: 120px">
				<h3><img alt="user" src="member/image/info.png">&nbsp;ȸ������</h3>
			</div>
			<form action="join.do" method="post" enctype="multipart/form-data">
				<div style="width: 200px; margin: 0px auto;">
				<div style="width: 200px; height: 200px;" >
					<img id="myimg" src="member/image/my.png" style="width: 200px; height: 200px; border-radius: 50%"/>
				</div>
				<div class="text-right" style="height: 50px">
					<input type="hidden" readonly="readonly" id="change">
					<label style="cursor: pointer;">������ ���� ���
					<input type='file' id="profile" name="profile" onchange="javascript:$('#change').value=this.value" style="display:none;" accept='image/*'/>
					</label>
				</div>
				</div>
				<div class="result_div">
					<input type="email" id="email" name="email" placeholder="���̵�(�̸���)�� �Է����ּ���." size="50px" class="result_input col-xs-8" maxlength="20" required />
					<input type="button" id="email_check" class="btn col-xs-4" value="�ߺ�üũ">
				</div>
				<div id="emailcon" class="text-left"></div>
				<div class="result_div">
					<input type="password" id="pwd" name="pwd" placeholder="��й�ȣ�� �Է����ּ���(8~20��)" size="50px" class="result_input form-control" style="font-family: ���ü" maxlength="20"/>
				</div>
				<div class="result_div">
					<input type="password" id="pwd_check" name="pwd_check" placeholder="��й�ȣ�� �ѹ� �� �Է����ּ���." size="50px" class="result_input form-control" style="font-family: ���ü" maxlength="20"/>
				</div>
				<div id="pwdcon" class="text-left"></div>
				<div class="result_div">
					<input type="text" id="name" name="name" placeholder="�̸��� �Է����ּ���." size="50px" class="result_input form-control" maxlength="20" required/>
				</div>
				<div id="namecon" class="text-left"></div>
				<div class="result_div">
					<input type="text" id="nick" name="nick" placeholder="�г����� �Է����ּ���." size="50px" class="result_input col-xs-8" maxlength="20" required/>
					<input type="button" id="nick_check" class="btn col-xs-4" value="�ߺ�üũ">
				</div>
				<div id="nickcon" class="text-left"></div>
				<div class="text-center">
					<label>�޴�����ȣ</label> 
				</div>
				<div class="result_div">
					<input type="text" id="tel" name="tel" placeholder="'��' ���� �Է����ּ���." class="result_input col-xs-8" maxlength="11"/>		
					<input type="button" id="tel_btn" value="������ȣ ����" class="btn col-xs-4">
				</div>
				<div class="result_div telcheck" style="display: none;">
					<input type="text" id="telcheck" name="telcheck" size="50px" class="result_input col-xs-8" placeholder="���۵� ������ȣ 5�ڸ��� �Է����ּ���." maxlength="5"/>
					<input type="button" id="telcheck_btn" value="Ȯ��" class="btn col-xs-4">
				</div>	
				<div id="telcon" class="text-left"></div>
				<div class="text-center">
					<label>�������</label>
				</div>
				<div class="result_div">
					<input type="date" id="birth" name="birth" size="60px" class="result_input form-control" required />
				</div>
				<div id="birthcon" class="text-left"></div>
				<div class="text-center">
					<label>ȸ������</label>
				</div>
				<div class="result_div"> <!-- �Ϲ�ȸ�� 0, ����ȸ��1 -->
					<label class="checkbox-wrap col-xs-6">�Ϲ�ȸ��<br><input type="radio" id="user" name="grade" value="0" class="grade" checked><i class="check-icon"></i></label>
					<label class="checkbox-wrap col-xs-6">����ȸ��<br><input type="radio" id="ceo" name="grade" value="1" class="grade"><i class="check-icon"></i></label>
				</div>
				<div class="reslut_div" id="grade" style="display: none;">
					<input type="text" id="companyno" name="companyno" placeholder="����� ��ȣ�� �Է����ּ���."size="50px" class="result_input form-control" maxlength="10"/>
				</div>
				<div id="gradecon" class="text-left"></div>
				<div class="text-center">
					<br><label>����</label>
				</div>
				<div class="result_div">
					<label class="checkbox-wrap col-xs-6">��<br><input type="radio" name="gender" value="0" checked><i class="check-icon"></i></label>
					<label class="checkbox-wrap col-xs-6">��<br><input type="radio" name="gender" value="1"><i class="check-icon"></i></label>
				</div>
				<div class="result_div">
					<input type="button" value="����" class="btn result_btn" id="joinBtn">&nbsp;
					<input type="button" value="���" class="btn result_btn" onclick="javascript:history.back()">
				</div>
			</form>
		</div>
	</div>
	<div style="height: 50px"></div>
</body>
</html>