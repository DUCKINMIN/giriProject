<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script> -->
<style type="text/css">
.row {
	margin: 0px auto;
	width: 60%;
	height: 400px;
	text-align: center;
}

.main_north {
	position: relative;
	margin: 0px auto;
	height: 480px;
	background-image: url("main2/img/back.png");
	background-size: cover;
	padding-top: 120px;
}

.main_jumpo {
	margin-top: 50px;
}

.main_jumpo p {
	font-size: 30pt;
}

.sidenav {
	margin-top: 95px;
	height: 450px;
	width: 17%;
	border-radius: 8px;
}

.jumpo_name {
	border-radius: 5px 5px 5px 5px;
	margin-bottom: 100px;
	height: 300px;
}

.state {
	margin: 0 auto;
	width: 60%;
	height: 50px;
	margin-top: 20px;
	margin-bottom: 10px;
}

.state p {
	font-size: 25pt;
}

.table_content {
	font-size: 11pt;
}

.table_title1 {
	background-color: #262626;
	color: white;
	font-size: 13pt;
}

.search_result {
	margin: 0 auto;
	width: 60%;
	height: 30px;
	margin-top: 20px;
	margin-bottom: 80px;
	text-align: center;
}

.search_result p {
	font-size: 29pt;
	font-weight: bold;
	border-bottom: 4px solid rgb(162, 0, 0);
}

.textbox {
	border: 2px solid rgb(162, 0, 0);
}

.insearch {
	width: 35%;
	margin: 0 auto;
}

.north_name {
	margin: 0 auto;
	text-align: center;
}

@media all and (min-width: 770px) and (max-width: 1200px) {
	.insearch {
		width: 60%
	}
}

@media all and (max-width: 770px) {
	.insearch {
		width: 85%
	}
	.sidenav {
		margin: 0px auto;
		height: 400px;
		
		width: 95%;
		margin-top: 45px;
		margin-bottom: 45px;
		border-radius: 8px;
	}
	.row {
		margin: 0px auto;
		width: 95%;
	}
	.state {
		margin: 0px auto;
		width: 95%;
		margin-top: 10px;
		margin-bottom: 5px;
	}
	.row_class h2 {
		width: 30%;
		margin-top: 20px;
		margin-left: 10px;
	}
	.row.time_side {
		height: auto;
	}
	.row h2 {
		margin: 0px auto;
		text-align: center;
	}
	.black_box {
		width: 88%;
	}
	.table_title1 {
		font-size: 10pt;
	}
	.table_content {
		font-size: 9pt;
	}
	.search_result p {
		font-size: 20pt;
		font-weight: bold;
		border-bottom: 4px solid rgb(162, 0, 0);
	}
	.state p {
		font-size: 19pt;
	}
}

@media all and (min-width: 100px) and (max-width: 770px) {
	.table_number {
		display: none;
	}
	.table_count {
		display: none;
	}
}
</style>

<script type="text/javascript">
<c:if test="${sessionScope.m_email==null}">
	location.href="index.jsp";
	alert("로그인 후 이용해주세요");
</c:if>
	$(function() {
		$("#main2btn").click(function() {
			$("#main2fmt").submit();
		});
		$.ajax({
			type : "post",
			url : "rank.do",
			success : function(res) {
				//alert(res);
				$('#rank').html(res);
			}
		});
		playAlert = setInterval(function() {
			$.ajax({
				type : "post",
				url : "rank.do",
				success : function(res) {
					//alert(res);
					$('#rank').html(res);
				}
			});
		}, 3000);
	});
</script>

</head>

<body>
	<div class="main_north">

		<div class="north_name">
			<p style="color: white; font-size: 25pt;">오늘 솔로들은</p>
			<p style="color: white; font-size: 35pt;">뭐하고 놀지?</p>
		</div>
		<form method="post" action="mainsearch.do" id="main2fmt">
			<div class="input-group insearch">
				<input type="text" name="search_name"
					class="search-query form-control textbox col-md-9"
					placeholder="지역/가게명" style="height: 50px; font-size: 20px;" /> <span
					class="input-group-btn">
					<button class="btn col-md-3" id="main2btn"
						style="height: 50px; width: 80px; text-align: center; font-size: 20px; position: relative; background-color: rgb(162, 0, 0); color: white;"
						type="button">
						<img src="main2/img/dot.png" style="width: 35px">
					</button>
				</span>
		</form>
	</div>

	</div>




	<div class="container-fluid">


		<div class="col-sm-3 sidenav" id="rank"></div>


		<div class="row_class">
			<div class="search_result">
				<p>"${search_name }" 의 검색결과</p>
			</div>
			<!-- 인크루드 1개 -->
			<jsp:include page="../main2/search_1.jsp"></jsp:include>
			<jsp:include page="../main2/search_2.jsp"></jsp:include>
			<jsp:include page="../main2/search_3.jsp"></jsp:include>
		</div>
	</div>
</body>
</html>