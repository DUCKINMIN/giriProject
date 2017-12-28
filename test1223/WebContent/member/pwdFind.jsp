<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>PWDFIND</title>
<style type="text/css">
	.pwdfindrow{	
		margin: 0px auto;
		width: 250px;
	}
	a:link {
		text-decoration:none;
	}
	.find_input{
		height: 60px; 
		padding-left: 20px;
		padding-right: 20px;
		font-size: medium;
	}
	.find_btn{
		background-color: rgb(162,0,0);
		color: white;
		width: 80px;
		height: 40px;
	}
</style>
<script type="text/javascript">
$(function(){
	$("#findpwd").click(function(){
		$("#pwdfindcon").html("");
		var email = $("#femail").val();
		var tel = $("#ftel").val();
		if (email.trim()=="") {
			$('#pwdfindcon').html("<font color=red>이메일을 입력해주세요</font>");
			$('#femail').focus();
			return;
		} else if(tel.trim()==""){
			$('#pwdfindcon').html("<font color=red>전화번호를 입력해주세요</font>");
			$('#ftel').focus();
			return;
		} 
		$.ajax({
			type:"post",
			url:"pwdFind.do",
			data:{"email":email,"tel":tel},
			success:function(data){
				var result = data;
				$("#pwdfindcon").html(data);
			}
		});
	});
});
</script>
</head>
<body>
	<div>
		<div class="row pwdfindrow">
			<div style="height: 30px"></div>
			<form>
    			<div>
      				<input id="femail" type="email" class="form-control find_input" placeholder="이메일을 입력하세요" required>
    			</div>
    			<div>
      				<input id="ftel" type="text" class="form-control find_input" placeholder="핸드폰 번호를 입력하세요." maxlength="11" required>
   				</div><br>
   				<div id="pwdfindcon" class="text-left"></div>
    			<div class="text-center"><br>
    				<button type="button" id="findpwd" class="btn find_btn">찾기</button>
    				<button type="button" class="btn find_btn closepwd">닫기</button>
    			</div>
  			</form>
		</div>
	</div>
</body>
</html>