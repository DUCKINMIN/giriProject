<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="EUC-KR">
<title>메인2</title>
<!-- <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
<script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script> -->
<link rel="stylesheet" type="text/css" href="css/star.css">
<script type="text/javascript">
	$(function() {
		$.ajax({
			type : "post",
			url : "mian2.do",
			success : function(res) {
				//alert(res);
				$('#weekbest').html(res);
			}
		});

	});
</script>
<style type="text/css">
.row {
	margin: 0px auto;
	width: 59%;
	height: 360px;
	text-align: center;
}

.main_north {
	position: relative;
	margin: 0px auto;
	height: 480px;
	background-image: url("main2/img/back.jpg");
	background-size: cover;
	padding-top: 120px;
}

.north_name {
	margin: 0 auto;
	text-align: center;
}

.sidenav {
	margin-top: 95px;
	background-color: #f1f1f1;
	height: 450px;
	width: 16%;
	border-radius: 8px;
}

.hot3_top h3 {
	margin: 0px auto;
}

#black_box {
	position: absolute;
	background-color: black;
	opacity: 0.4;
	width: 50%;
	height: 480px;
}

.black_box {
	position: absolute;
	background-color: black;
	opacity: 0.6;
	width: 59%;
	height: 360px;
}

.jumpo_name {
	position: relative;
	display: inline-block;
	font-size: 37pt;
	margin-top: 30px;
	color: white;
	display: inline-block;
}

.like img, .hit img {
	width: 30px;
	margin-top: 10px;
}

.rating img {
	width: 80px;
	height: 25px;
	margin-top: 10px;
}

.rating h2 {
	margin-bottom: 9px;
}

.like, .rating, .hit {
	padding: 20px;
	height: 135px;
	margin-top: 30px;
	border-left: 6px solid rgb(255, 255, 255);
	margin-bottom: 4px;
	margin-top: 50px;
	width: 150px;
}

.hit {
	height: 135px;
	border-right: 6px solid rgb(255, 255, 255);
}

.like p, .rating p, .hit p {
	font-size: 20px;
	margin-bottom: 0px;
	margin-top: 0px;
}

.cb_info_table {
	margin: 0px auto;
}

.total_tool {
	width: 100px;
	border: 3px solid rgb(255, 255, 255);
	margin: 0 auto;
}

.state {
	margin: 0 auto;
	width: 60%;
	height: 50px;
	margin-top: 40px;
	margin-bottom: 15px;
}

.state p {
	font-size: 35px;
}

.insearch {
	width: 35%;
	margin: 0 auto;
}

.textbox {
	border: 2px solid rgb(162, 0, 0);
}

.main_jumpo {
	margin-top: 30px;
}

.weekend {
	margin: 0 auto;
	height: 75px;
	text-align: center;
	margin-top: 70px;
	width: 35%;
	border-bottom: 5px solid rgb(162, 0, 0);
}

.weekend h1 {
	font-size: 35pt;
	margin-bottom: 0px;
}

.weekend strong {
	font-size: 55pt;
	color: rgb(162, 0, 0);
}

@media all and (min-width: 770px) and (max-width: 1200px) {
	.insearch {
		width: 60%
	}
}

@media screen and (max-width: 750px) {
	.weekend {
		margin: 0 auto;
		height: 80px;
		text-align: center;
		margin-top: 30px;
		width: 90%;
		border-bottom: 3px solid rgb(162, 0, 0);
	}
	.weekend h1 {
		font-size: 25pt;
	}
	.weekend strong {
		font-size: 35pt;
	}
	.insearch {
		width: 85%
	}
	.state p {
		font-size: 30px;
	}
	.sidenav {
		margin: 0px auto;
		height: 300px;
		width: 95%;
		margin-top: 45px;
		border-radius: 8px;
	}
	.row {
		margin: 0px auto;
		width: 95%;
	}
	.state {
		margin: 0px auto;
		width: 95%;
		margin-top: 20px;
		margin-bottom: 5px;
	}
	.row_class h2 {
		width: 30%;
		margin-top: 50px;
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
		width: 95%;
	}
	.like img, .hit img {
		width: 15px;
	}
	.rating img {
		width: 60px;
	}
	.rating h2 {
		margin-bottom: 9px;
	}
	.like, .rating, .hit {
		padding: 5px 25px;
		margin-top: 70px;
		border-left: 3px solid rgb(255, 255, 255);
		margin-bottom: 4px;
		width: 100px;
		height: 110px;
		padding: 5px 5px;
	}
	.hit {
		margin-top: 70px;
		height: 110px;
		border-right: 3px solid rgb(255, 255, 255);
	}
	.like h2, .rating h2, .hit h2 {
		font-size: 20px;
	}
	.like h3, .rating h3, .hit h3 {
		text-align: center;
	}
	.like b, .rating b, .hit b {
		font-size: 7px;
		text-align: center;
	}
	.cb_info_table {
		margin: 0px auto;
		width: 247px;
	}
	.like h2, .rating h2, .hit h2 {
		font-size: 20px;
		font-weight: bold;
	}
	.cb_detail p {
		font-size: 20px;
	}
	.jumpo_name {
		font-size: 35px;
	}
}
</style>
<script type="text/javascript">
	$(function() {
		$("#main2btn").click(function() {
			$("#main2fmt").submit();
		});
	});
</script>
</head>
<body>

	<div class="main_north">
		<div id="black_box"></div>
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
			</div>
		</form>


	</div>






	<div class="container-fluid">

		<div class="content time_side">
			<div class="col-sm-3 sidenav">
				<h4>실시간 핫3</h4>
				<div class="input-group">
					<span class="input-group-btn">
						<h1>photo</h1>
					</span>
				</div>
			</div>
		</div>

		<div class="weekend">

			<h1>
				주간 <strong>HOT</strong> 플레이스
			</h1>
		</div>

		<div class="row_class" id="weekbest">

			<!-- 인크루드 -->
		</div>
	</div>






	<footer>
		<p>&copy; 덕인 Company</p>
	</footer>
</body>
</html>