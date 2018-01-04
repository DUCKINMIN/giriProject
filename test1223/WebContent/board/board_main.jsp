<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
a {
	color: black;
}

.board_btn {
	background-color: white;
	border: 1px solid #B4B4B4;
	font-size: 18px;
	border-radius: 0%;
	width: 80px;
	height: 40px;
	padding: 0px;
}
/* #board_ssulBtn{
		background-color: rgb(162,0,0);
		color: white;
	} */
#board_search {
	height: 40px;
	float: left;
	width: 50%;
}

#search {
	margin-top: 10px;
}

#board_searchSel {
	height: 40px;
	width: 80px;
	font-size: 15px;
	align-content: center;
	float: left;
}

#board_ssulBtn {
	float: left;
}

#board_insertBtn {
	float: right;
}

.board-th {
	font-size: 16px;
}

.board-td {
	font-size: 14px;
}

#board_tr:hover {
	background-color: #ededed;
}

.board-td a {
	color: black;
	text-decoration: none;
}

.board-th, .board-td {
	height: 40px;
}

#board_page {
	width: 500px;
	margin: 0 auto;
}

#board_page a {
	color: black;
	text-decoration: none;
	font-size: 15px;
}

@media ( max-width : 993px) {
	.board-th {
		width: 20%;
		font-size: 13px;
	}
	.board-td {
		width: 20%;
		font-size: 13px;
	}
	.board_Tsub {
		width: 25%;
	}
	.board_Tno {
		width: 15%;
	}
	.board_btn, #board_searchSel {
		width: 50px;
		font-size: 15px;
	}
	#board_page {
		width: 100%;
	}
	.container>h2 {
		border-bottom: 2px solid #bbb;
	}
}
</style>
<!-- 게시판 모드 css -->
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		 	  var grade = ${grade};
		 var id = $(this).attr("id");
		 if(grade=="0"){
		 $('#board_ssulBtn').css("background", "rgb(162,0,0)");
		 $('#board_ssulBtn').css("color", "rgb(255, 255, 255)");
		 }
		 else{
		 $('#board_counselBtn').css("background", "rgb(162,0,0)");
		 $('#board_counselBtn').css("color", "rgb(255, 255, 255)");
		 } 

		$(".tab_content").hide();
		$(".tab_content:first").show();
		
		$("ul.tabs li").click(function() {
			var id = $(this).attr("id");
			$(".tab_content").hide()
			var activeTab = $(this).attr("rel");
			
			$("#" + activeTab).fadeIn();
			if(id=="board_counselBtn")
				$('#frm1').submit();
			else
				$('#frm0').submit();
			
		});
		/*  $.ajax({
			type:"POST",
			url:"ssullist.do",
			data:{"grade":grade,"page":1}, //데이터 여러개일 때 => "day":day,"page":1 
			//json방식(객체형식)
			success:function(response){
				$('#grade').html(response);
			}

		}); */

		/*$.ajax({
		 type:"POST",
		 url:"ssullist.do",
		 data:{"grade":grade,"page":1}, //데이터 여러개일 때 => "day":day,"page":1 
		 //json방식(객체형식)
		 success:function(response){
		 $('#grade').html(response);
		 }

		 }); 
		 });*/
	});
</script>
<style>
ul.tabs {
    margin: 0;
    padding: 0;
    float: left;
    list-style: none;
    height: 40px;
   /*  border-bottom: 1px solid #eee; */
    border-left: 1px solid #eee;
    width: 100%;
    /* font-family:"dotum";
    font-size:15px; */
}
ul.tabs li {
    float: left;
    text-align:center;
    cursor: pointer;
    width: 80px;
	height: 40px;
    line-height: 40px;
    border: 1px solid #eee;
    border-left: none;
    font-weight: bold;
    background: #fff;
    overflow: hidden;
    position: relative;
}
ul.tabs li.active {
/*     background: rgb(162,0,0);
    color: white;
    border-bottom: 1px solid #FFFFFF; */
}
.tab_container {
   /*  border: 1px solid #eee; */
    border-top: none;
    clear: both;
    float: left;
    /* width: 248px; */
    /* background: #FFFFFF; */
}
.tab_content {
   /*  padding: 5px; */
   /*  font-size: 12px; */
    display: none;
}
.tab_container .tab_content ul {
    width:100%;
    margin:0px;
    padding:0px;
}
.tab_container .tab_content ul li {
    /* padding:5px; */
    list-style:none
}
;
 #container {
    width: 249px;
    margin: 0 auto;
}
</style>
<body>
	<div class="container">
		<h2>커뮤니티</h2>
		<div style="height: 20px"></div>
		<ul class="tabs"><form id="frm0" method="POST" action="board_list.do">
			<li class="btn board_btn board_modeBtn" rel="tab1"
				id="board_ssulBtn">썰전
				<input type="hidden" name="grade" value="0">
				</li></form>
		<form id="frm1" method="POST" action="board_list.do">
			<li rel="tab2" class="btn board_btn board_modeBtn"
				id="board_counselBtn">상담
				<input type="hidden" name="grade" value="1">
				</li></form>
		</ul>
		<div style="height: 10px"></div>
		<!-- include -->
		<div class="tab_container">
			<div class="container tab_content" id="tab1">
				<jsp:include page="${sub_jsp }"></jsp:include>
			</div>

			<div class="container tab_content" id="tab2">
				<jsp:include page="${sub_jsp }"></jsp:include>
			</div>
		</div>
	</div>

</body>
</html>