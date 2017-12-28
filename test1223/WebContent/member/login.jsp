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
	$(".closebtn").click(function(){
		$('#joinModal').modal('hide');
		$('#idFindModal').modal('hide');
		$('#pwdFindModal').modal('hide');
	});
});
</script>
</head>
<body>
	<div>
		<div class="row loginrow">
			<div style="height: 20px"></div>
			<form action="login_ok.do" method="post">
    			<div class="login_div">
      				<input id="email" type="email" class="form-control login_input" name="email" placeholder="Email" required>
    			</div>
    			<div class="login_div">
      				<input id="password" type="password" class="form-control login_input" name="password" placeholder="Password" required>
   				</div>
    			<br>
    			<div class="text-right login_text">
    				<a href="join.do">회원가입</a><br>
    				<a href="#idFindModal" data-toggle="modal">아이디 찾기</a> / 
    				<a href="#pwdFindModal" data-toggle="modal">비밀번호 찾기</a>
    			</div>
    			<div class="text-center"><br>
    				<button type="submit" class="btn login_btn">로그인</button>
    			</div>
  			</form>
		</div>
	</div>
	
	<!-- 아이디찾기 -->
    <div class="modal fade" id="idFindModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" 
    data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
        	<div class="modal-content">
            	<div class="modal-header">
                	<button type="button" class="close closebtn" onclick="javascript:close()">
                    	<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">아이디 찾기</h3>
                </div>
            	<div class="modal-body">
            		<jsp:include page="idFind.jsp"/>
            	</div>
        	</div>
    	</div>
	</div>
	<!-- 비밀번호찾기 -->
	<div class="modal fade" id="pwdFindModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" 
	data-backdrop="static" data-keyboard="false">
		<div class="modal-dialog">
        	<div class="modal-content">
            	<div class="modal-header">
                	<button type="button" class="close closebtn">
                    	<span aria-hidden="true" style="color:white">X</span><span class="sr-only">Close</span>
                    </button>
                    <h3 class="modal-title" id="myModalLabel">비밀번호 찾기</h3>
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