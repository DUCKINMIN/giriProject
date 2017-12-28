<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	/* String hot3grade = request.getParameter("hot3grade"); */
	String jsp = "../hot3/hot3list.jsp";
	String jsp2 = "../hot3/cbInsert.jsp";
	
/* 	if(hot3grade == null || hot3grade.equals("1"))
		jsp += "?hot3grade="+hot3grade; */
%>
<%-- <c:set var="hot3grade" value="<%= hot3grade %>"/> --%>
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
<script type="text/javascript">
	$(document).ready(function() {
		$(".hot3chk").on("click", function() {
			var bc = $(this).css("background-color");
			/* alert(bc); */
			if (bc == "rgb(38, 38, 38)") {
				$(this).css("background", "rgb(162,0,0)");
				$(this).css("transform", "scale(1.1)");
			} else {
				$(this).css("background", "rgb(38, 38, 38)");
				$(this).css("transform", "scale(1)");
			}
		});
		
 		$(".hot3grade").on("click", function() {
			$(".hot3grade").css("font-weight", "normal");
			var grade = $(this).attr("id");
			$(this).css("font-weight", "bold");
		}); 
	});
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
						<img src="../hot3/image/hot3addr.png" class="hot3srchimg">
					</th>
					<td class="text-center hot3td">
						<input type="button" value="홍대" class="btn hot3chk" name="hongik">
					</td>
					<td class="text-center hot3td">
						<input type="button" value="이태원" class="btn hot3chk" name="itaewon">
					</td>
					<td class="text-center hot3td">
						<input type="button" value="강남" class="btn hot3chk" name="gangnam">
					</td>
					<td width=20%></td>
				</tr>
				
				<tr>
					<th class="text-center hot3th">
						<img src="../hot3/image/hot3cbgrade.png" class="hot3srchimg">
					</th>
					<td class="text-center hot3td">
						<input type="button" value="클럽" class="btn hot3chk" name="club">
					</td>
					<td class="text-center hot3td">
						<input type="button" value="감성주점" class="btn hot3chk" name="gamsung">
					</td>
					<td class="text-center hot3td">
						<input type="button" value="헌팅술집" class="btn hot3chk" name="hunting">
					</td>
					<td class="text-center hot3td">
						<input type="button" value="나이트" class="btn hot3chk" name="night">
					</td>
				</tr>
				
				<tr>
					<th class="text-center hot3th">
						<img src="../hot3/image/hot3namesrch.png" class="hot3srchimg">
					</th>
					<td colspan=3 class="text-center">
						<input type="text" style="margin-top: 10px" name="hot3search" id="hot3searchText">
					</td>
					<td>
						<input type="button" value="검색" class="btn hot3srch" name="hot3search">
					</td>
				</tr>
			</table>
		</div>
		<br>
		
		<a href="#" class="btn hot3insert" name="hot3insert">점포등록</a>
 		<!-- <input type="button" value="조회순▼" class="hot3grade btn" id="hit" />&nbsp; 
		<input type="button" value="별점순▼" class="hot3grade btn" id="rating"/>&nbsp;
		<input type="button" value="최신순▼" class="hot3grade btn" id="new"/><br><br> -->

		<a href="#" class="hot3grade" id="hit" style="ont-weight: bold">조회순▼</a>&nbsp;
		<a href="#" class="hot3grade" id="rating">별점순▼</a>&nbsp;
		<a href="#" class="hot3grade" id="new">최신순▼</a>
		
		<jsp:include page="<%= jsp %>"></jsp:include>
		
		<div id="board_page">
			<center>
				<a href="#"></a>&nbsp;&nbsp;&nbsp;
				<c:forEach var="i" begin="1" end="10">
					<a href="#">${i}</a>&nbsp;
                  </c:forEach>
				&nbsp;&nbsp;&nbsp;<a href="#">></a>
			</center>
		</div> 
	</div>
</body>