<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<style type="text/css">
.idrow {
	margin: 0 auto;
	width: 300px;
}
</style>
<script type="text/javascript">
	$(function() {
		$('#checkBtn').click(function() {
							var email = $('#email').val();
							if (email.trim() == "") {
								$('#email').focus();
								return;
							}
							$.ajax({
								type : "post", //데이터전송방식
								url : "join.do", //어디로보낼지
								data : {"email" : email}, // {"키":값,"키":값} 보낼데이터
								success : function(request) { //성공시 response에 결과값넣기
									var count = request.trim();
									if (count == 0) {
										alert("dd");
										/* $('#res').html("<font color=blue>"+email+"은(는) 사용 가능한 아이디입니다</font>"); //html 원래있던 html을 지우고 추가
										$('#res_ok').html(//append 맨마지막줄에 추가
											"<input type=button value='확인' onclick=ok('"+email+"')>"
											); */
									} else {
										alert("nn");
										/* $('#res').html("<font color=red>"+email+"은(는) 이미 사용중인 아이디입니다</font>");
										$('#email').val("");
										$('#email').focus();
										$('#res_ok').html(""); */
									}
								}
							});
		});
	});
	
	function ok(id){
		parent.frm.id.value=id;
		parent.Shadowbox.close();
	}
</script>

</head>
<body>
	<div class="container">
		<div class="row idrow">
			<table class="table table-hover" id="res_table">
				<tr>
					<td class="text-left">ID:
						<input type="text" name="email" size="12" id="email">
						<input type="button" value="중복체크" class="btn btn-info btn-xs" id="checkBtn">
					</td>
				</tr>
				<tr>
					<td class="text-center" id="res"></td>
				</tr>
				<tr>
					<td class="text-center" id="res_ok"></td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>