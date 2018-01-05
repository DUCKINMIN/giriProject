<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>HOT3</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style type="text/css">
.hot3row {
	width: 70%;
}

.hot3th, .hot3td {
	width: 110px;
}

.hot3chk, .hot3srch {
	font-size: 18px;
	width: 100%;
	transition: 0.2s;
	background: #262626;
	color: white;
	margin: 10px 0px;
}

.btn:focus {
	outline: none;
	color: white;
}

.btn:hover {
	color: #aaa;
	transition: 0.2s;
}

#hot3searchText {
	width: 100%;
	font-size: 20px;
	color: #262626;
	font-size: 20px;
}

.hot3chk {
	height: 50px;
}

#hot3menu {
	font-size: 30px;
}

.hot3grade {
	color: #262626;
	cursor: pointer;
}

a:hover, a:focus {
	color: #262626;
	text-decoration: none;
}

.hot3insert {
	width: 100%;
	background: #262626;
	color: white;
}

.hot3srchimg {
	margin-top: 10px;
}

@media screen and (max-width: 750px) {
	.hot3row {
		width: 100%;
	}
	.hot3th, .hot3td {
		margin: 0px;
	}
	.hot3grade {
		font-size: 10px;
		width: 60px;
	}
	.hot3chk, .hot3srch {
		font-size: 14px;
	}
	.hot3chk {
		height: 30px;
	}
	.hot3srchimg {
		width: 30px;
	}
}
</style>

<style type="text/css">
.hot3list {
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

.hot3content {
	padding-top: 50px;
	margin-bottom: 30px;
	background-color: rgba(38, 38, 38, 0.6);
	z-index: 1;
}

.hot3content:hover {
	cursor: pointer;
}

.hot3cb_name, .hot3cb_content {
	color: white;
	margin: 0px auto;
	padding: 10px 10px;
	text-align: center;
	font-size: 34px;
}

.hot3cb_content {
	width: 40%;
	font-size: 22px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.hot3cb_hit {
	color: white;
	padding: 5px 10px;
	text-align: right;
	font-size: 26px;
}

#pages>span {
	cursor: pointer;
}

@media screen and (max-width: 750px) {
	.hot3content {
		padding-top: 20px;
		margin-bottom: 10px;
	}
	.hot3content:hover {
		cursor: pointer;
	}
	.hot3cb_name, .hot3cb_content {
		font-size: 24px;
	}
	.hot3cb_content {
		width: 60%;
		font-size: 12px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.hot3cb_hit {
		text-align: right;
		font-size: 12px;
	}
}
</style>

<script type="text/javascript">
	$(function() {
		var cb_grade = "";
		var a_addr1 = "";
		var order = "";
		var cb_name = "";
		
		showlist(cb_grade, a_addr1, order, cb_name);

		$(".hot3srch").click(function() {
			cb_name = $.trim($("#hot3searchText").val()).replace(/\s\s+/g, ' ');
			
			if(cb_name == "") {
				$("#hot3searchText").focus();
			} else {
				showlist(cb_grade, a_addr1, order, cb_name);
				$("#hot3searchText").val("");
			}
		})
		
		$(".hot3chk").click(function() {
			a_addr1 = "";
			cb_name = "";
			cb_grade = "";
			var bc = $(this).css("background-color");

			if (bc == "rgb(38, 38, 38)") {
				$(this).css("background", "rgb(162, 0, 0)");
				$(this).css("transform", "scale(1.1)");
				
				if($(this).hasClass("hot3a") == true)
					a_addr1 = $(this).attr("name");
				if($(this).hasClass("hot3g") == true)
					cb_grade = $(this).attr("name");

				for (var i = 0; i < 3; i++) {
					var a = $("#a_addr1_" + i);

					if (a.css("background-color") == "rgb(162, 0, 0)") {
						a_addr1 += "," + a.attr("name");
					}
				}

				for (var i = 0; i < 4; i++) {
					var g = $("#cb_grade_" + i);

					if (g.css("background-color") == "rgb(162, 0, 0)") {
						cb_grade += "," + g.attr("name");
					}
				}
			} else {
				$(this).css("background", "rgb(38, 38, 38)");
				$(this).css("transform", "scale(1)");
				
				for (var i = 0; i < 3; i++) {
					var a = $("#a_addr1_" + i);

					if ($(this).attr("name") != a.attr("name")) {
						if (a.css("background-color") == "rgb(162, 0, 0)") {
							a_addr1 += a.attr("name") + ",";
						}
					}
				}

				for (var i = 0; i < 4; i++) {
					var g = $("#cb_grade_" + i);

					if ($(this).attr("name") != g.attr("name")) {
						if (g.css("background-color") == "rgb(162, 0, 0)") {
							cb_grade += g.attr("name") + ",";
						}
					}
				}
			}

			showlist(cb_grade, a_addr1, order, cb_name);
		});

		$(".hot3grade").on("click", function() {
			$(".hot3grade").css("font-weight", "normal");
			var grade = $(this).attr("id");
			$(this).css("font-weight", "bold");
			order = $(this).attr("id");
			showlist(cb_grade, a_addr1, order, cb_name);
		});
	});
	
	var showlist = function showlist(g, a, o, n) {
		$.ajax({
			type : "POST",
			url : "hot3search.do",
			data : {
				"cb_grade" : g,
				"a_addr1" : a,
				"order" : o,
				"cb_name" : n
			},
			success : function(res) {
				$("#list_info").html(res);
			}
		});
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row hot3row">
			<div style="height: 70px"></div>
			<strong id="hot3menu">HOT3</strong>
			<table class="table hot3table text-center">
				<tr>
					<th class="text-center hot3th">
						<img src="hot3/image/hot3addr.png" class="hot3srchimg">
					</th>
					<td class="text-center hot3td">
						<input type="submit" value="홍대" id="a_addr1_0" class="btn hot3chk hot3a" name="마포구,서대문구">
					</td>
					<td class="text-center hot3td">
						<input type="submit" value="이태원" id="a_addr1_1" class="btn hot3chk hot3a" name="용산구,중구">
					</td>
					<td class="text-center hot3td">
						<input type="submit" value="강남" id="a_addr1_2" class="btn hot3chk hot3a" name="강남구,서초구">
					</td>
					<td width=20%></td>
				</tr>
				
				<tr>
					<th class="text-center hot3th">
						<img src="hot3/image/hot3cbgrade.png" class="hot3srchimg">
					</th>
					<td class="text-center hot3td">
						<input type="button" value="클럽" id="cb_grade_0" class="btn hot3chk hot3g" name="0">
					</td>
					<td class="text-center hot3td">
						<input type="button" value="감성주점" id="cb_grade_2" class="btn hot3chk hot3g" name="2">
					</td>
					<td class="text-center hot3td">
						<input type="button" value="헌팅술집" id="cb_grade_3" class="btn hot3chk hot3g" name="3">
					</td>
					<td class="text-center hot3td">
						<input type="button" value="나이트" id="cb_grade_1" class="btn hot3chk hot3g" name="1">
					</td>
				</tr>
				
				<tr>
					<th class="text-center hot3th">
						<img src="hot3/image/hot3namesrch.png" class="hot3srchimg">
					</th>
					<td colspan=3 class="text-center">
						<input type="text" style="margin-top: 10px" placeholder="가게명을 입력하세요." id="hot3searchText" class="form-control">
					</td>
					<td>
						<input type="button" value="검색" class="btn hot3srch" name="hot3search">
					</td>
				</tr>
			</table>
		</div>
		<br>
		
		<a href="hot3insert.do" class="btn hot3insert" name="hot3insert">점포등록</a>
		<a href="hot3update.do?email=${sessionScope.m_email}" class="btn hot3insert" name="hot3insert">점포수정</a>
		<a href="hot3delete_ok.do?cb_no=47" class="btn hot3insert" name="hot3insert">점포삭제</a>
		
		<span class="hot3grade" id="hit" style="font-weight:bold">조회순▼</span>&nbsp;
		<span class="hot3grade" id="rating">별점순▼</span>&nbsp;
		<span class="hot3grade" id="jjim">찜순▼</span>&nbsp;
		
		<div id="list_info"></div>
	</div>
</body>