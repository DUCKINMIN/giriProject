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
	.board_btn{
		background-color: white;
		border: 1px solid #B4B4B4;
		font-size: 18px;
		border-radius: 0%;
		width: 80px;
		height: 40px;
		padding: 0px;
	}
	#board_ssulBtn{
		background-color: rgb(162,0,0);
		color: white;
	}
	#board_search{
		height: 40px;
		float: left;
		width: 50%;
	}
	#search{
		margin-top: 10px;
	}
	#board_searchSel{
		height: 40px;
		width: 80px;
		font-size: 15px;
		align-content: center;
		float: left;
	}
	#board_ssulBtn{
		float:left;
	}
	#board_insertBtn{
		float:right;
	}
	.board-th{
		font-size: 16px;
	}
	.board-td{
		font-size: 14px;
	}
	#board_tr:hover{
		background-color: #ededed;
	}
	.board-td a{
		color: black;
		text-decoration: none;
	}
	.board-th, .board-td{
		height:40px;
	}
	#board_page{
		width: 500px;
		margin: 0 auto;
	}
	#board_page a{
		color: black;
		text-decoration: none;
		font-size: 15px;
	}
	
	@media ( max-width : 993px) {
		.board-th{
			width: 20%;
			font-size: 13px;
		}
		.board-td{
			width: 20%;
			font-size: 13px;
		}
		.board_Tsub{
			width: 25%;
		}
		.board_Tno{
			width: 15%;
		}
		.board_btn, #board_searchSel{
			width: 50px;
			font-size: 15px;
		}
		#board_page{
			width: 100%;
		}
		.container > h2{
			border-bottom: 2px solid #bbb;
		}
	}
</style>
<!-- 게시판 모드 css -->
<script type="text/javascript">
   $(document).ready(function() {
      $(".board_modeBtn").on("click", function() {
         var id = $(this).attr("id");
      	 $(this).css("background", "rgb(162,0,0)");
         $(this).css("color", "rgb(255, 255, 255)");
         $('.board_modeBtn').not("#"+id).css("background", "rgb(255, 255, 255)");
		 $('.board_modeBtn').not("#"+id).css("color", "rgb(1, 1, 1)");
      });
   });
</script>
<body>
	<div class="container">
		<h2>커뮤니티</h2>
		<div style="height: 20px"></div>
		<div>
			<input type="button" class="btn board_btn board_modeBtn" value="썰전" id="board_ssulBtn">
			<input type="button" class="btn board_btn board_modeBtn" value="상담" id="board_counselBtn">
		</div>
		<div style="height: 10px"></div>
		<div>
			<!-- include -->
			<jsp:include page="content.jsp"></jsp:include>
		</div>
	</div>

</body>
</html>