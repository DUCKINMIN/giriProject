<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>IDFIND</title>
<style type="text/css">
	.emailfindrow{	
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
		$("#findemail").click(function(){
			$("#emailfindcon").html("");
			var name = $("#name").val();
			var tel = $("#tel").val();
			if (name.trim()=="") {
				$('#emailfindcon').html("<font color=red>�̸��� �Է����ּ���</font>");
				$('#name').focus();
				return;
			} else if(tel.trim()==""){
				$('#emailfindcon').html("<font color=red>��ȭ��ȣ�� �Է����ּ���</font>");
				$('#tel').focus();
				return;
			} 
			$.ajax({
				type:"post",
				url:"emailFind.do",
				data:{"name":name,"tel":tel},
				success:function(data){
					var result = data;
					$("#emailfindcon").html(data);
				}
			});
		});
	});
</script>
</head>
<body>
	<div>
		<div class="row emailfindrow">
			<div style="height: 30px"></div>
			<form>
    			<div>
      				<!-- <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span> -->
      				<input id="name" type="text" class="form-control find_input" placeholder="�̸��� �Է��ϼ���" required>
    			</div>
    			<div>
      				<input id="tel" type="text" class="form-control find_input" placeholder="�ڵ��� ��ȣ�� �Է��ϼ���." maxlength="11" required>
   				</div><br>
   				<div id="emailfindcon" class="text-left"></div>
    			<div class="text-center"><br>
    				<button type="button" id="findemail" class="btn find_btn">ã��</button>
    				<button type="button" class="btn find_btn closeemail">�ݱ�</button>
    			</div>
  			</form>
		</div>
	</div>
</body>
</html>