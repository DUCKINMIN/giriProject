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
								type : "post", //���������۹��
								url : "join.do", //���κ�����
								data : {"email" : email}, // {"Ű":��,"Ű":��} ����������
								success : function(request) { //������ response�� ������ֱ�
									var count = request.trim();
									if (count == 0) {
										alert("dd");
										/* $('#res').html("<font color=blue>"+email+"��(��) ��� ������ ���̵��Դϴ�</font>"); //html �����ִ� html�� ����� �߰�
										$('#res_ok').html(//append �Ǹ������ٿ� �߰�
											"<input type=button value='Ȯ��' onclick=ok('"+email+"')>"
											); */
									} else {
										alert("nn");
										/* $('#res').html("<font color=red>"+email+"��(��) �̹� ������� ���̵��Դϴ�</font>");
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
						<input type="button" value="�ߺ�üũ" class="btn btn-info btn-xs" id="checkBtn">
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