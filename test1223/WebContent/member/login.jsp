<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>LOGIN</title>
<style type="text/css">
	.loginrow{	
		margin: 0px auto;
		width: 300px;
	}
	a:link{
		text-decoration:none;
	}
	.login_btn{
		background-color: rgb(162,0,0);
		color: white;
		width: 150px;
		height: 50px;
	}
	.login_div{
		height: 70px;
	}
	.login_input{
		height: 70px; 
		padding-left: 20px;
		padding-right: 20px;
		font-size: medium;
	}
	.login_text{
		color: white;
	}
	.login_text a{
		color: white;
	}
</style>
<script type="text/javascript">
$(function(){
	$(".closeemail").click(function(){
		$("#emailfindcon").html("");
		$("#name").val("");
		$("#tel").val("");
		$('#emailFindModal').modal('hide');
	});
	$(".closepwd").click(function(){
		$("#pwdfindcon").html("");
		$("#email").val("");
		$("#tel").val("");
		$('#pwdFindModal').modal('hide');
	});
	
});
$(function(){
	$('#loginBtn').click(function(){
		var email = $('#email').val();
		var pwd = $('#pwd').val();
		if (email.trim()=="") {
			$('#logincon').html("<font color=red>���̵� �Է����ּ���</font>");
			$('#email').focus();
			return;
		} else if(pwd.trim()==""){
			$('#logincon').html("<font color=red>��й�ȣ�� �Է����ּ���</font>");
			$('#pwd').focus();
			return;
		}
		
		$.ajax({
			type:"post",
			url:"loginok.do",
			data:{"email":email,"pwd":pwd},
			success:function(data){
				var count = data.trim();
				if(count==0){
					$('#logincon').html("<font color=red>���̵�� �������� �ʽ��ϴ�</font>");
					$('#email').val("");
					$('#pwd').val("");
					$('#email').focus();
				} else if(count==2){
					$('#logincon').html("<font color=red>��й�ȣ�� ��ġ���� �ʽ��ϴ�</font>");
					$('#pwd').val("");
					$('#pwd').focus();
				} else {
					location.href="main.do";
				}
			}
		});
	});
});
</script>
</head>
<body>
	<div>
		<div class="row loginrow">
			<div style="height: 20px"></div>
			<form action="loginok.do" method="post">
    			<div class="login_div">
      				<input id="email" type="email" class="form-control login_input" name="email" placeholder="Email" required>
    			</div>
    			<div class="login_div">
      				<input id="pwd" type="text" class="form-control login_input" name="pwd" placeholder="Password" required>
   				</div>
   				<div id="logincon" class="text-left"></div>
    			<br>
    			<div class="text-right login_text">
    				<a href="joinpage.do">ȸ������</a><br>
    				<a href="#emailFindModal" data-toggle="modal">���̵� ã��</a> / 
    				<a href="#pwdFindModal" data-toggle="modal">��й�ȣ ã��</a>
    			</div>
    			<div class="text-center"><br>
    				<button type="button" class="btn login_btn" id="loginBtn">�α���</button>
    			</div>
  			</form>
		</div>
	</div>
	<!-- ���̵�ã�� -->
    <div class="modal fade" id="emailFindModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" 
    data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-sm">
        	<div class="modal-content">
            	<div class="modal-header">
                	<button type="button" class="close closebtn" onclick="javascript:close()">
                    	<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">���̵� ã��</h3>
                </div>
            	<div class="modal-body">
            		<jsp:include page="emailFind.jsp"/>
            	</div>
        	</div>
    	</div>
	</div>
	<!-- ��й�ȣã�� -->
	<div class="modal fade" id="pwdFindModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" 
	data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog modal-sm">
        	<div class="modal-content">
            	<div class="modal-header">
                	<button type="button" class="close closebtn">
                    	<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">��й�ȣ ã��</h3>
                </div>
            	<div class="modal-body">
            		<jsp:include page="pwdFind.jsp"/>
            	</div>
        	</div>
    	</div>
	</div>
	<div style="height: 20px"></div>
</body>
</html>