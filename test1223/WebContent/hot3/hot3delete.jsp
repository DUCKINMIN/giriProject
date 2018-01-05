<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>점포등록</title>
<%-- 쉐도우박스 --%>
<!-- <link rel="stylesheet" href="../member/shadow/css/shadowbox.css">
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script> -->
<style type="text/css">
.cbInsertrow {
	width: 60%;
	margin: 0px auto;
}

.cbInsert_input {
	height: 70px;
	padding-left: 20px;
	padding-right: 20px;
	font-size: medium;
}

#phone_btn {
	background-color: rgb(162, 0, 0);
	color: white;
	height: 70px;
}

#gender, #gender2 {
	height: 50px;
	background-color: white;
	border: 1px solid gray;
}

.cbInsert_btn {
	background-color: rgb(162, 0, 0);
	color: white;
	height: 50px;
	width: 150px;
	font-size: 20px;
}

.checkbox-wrap {
	cursor: pointer;
	margin-right: 2%;
}

.checkbox-wrap .check-icon {
	display: inline-block;
	width: 50px;
	height: 50px;
	background: url(../hot3/image/hot3check.png) left center no-repeat;
	vertical-align: middle;
	transition-duration: .3s;
}

.checkbox-wrap input[type=radio] {
	display: none;
}

.checkbox-wrap input[type=radio]:checked+.check-icon {
	background-image: url(../hot3/image/hot3uncheck.png);
}

.hot3chk {
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

/* 파일업로드 */
.input-file {
	/* display: inline-block; */
	width: 100%;
}

.input-file [type="file"] {
	position: absolute;
	width: 100%;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0 none;
}

.input-file .filelabel {
	/* display: inline-block; */
	/* min-width: 53px; */
	height: 40px;
	line-height: 40px;
	padding: 0 0px;
	border-radius: 2px;
	font-size: 13px;
	/* background-color: #333; */
	/* color: #fff; */
	text-align: center;
	width: 80px;
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

.input-file .filename {
	width: 50%;
	background: #f5f5f5;
	height: 40px;
	line-height: 26px;
	text-indent: 5px;
	border: 1px solid #bbb;
} /* 접근성 탭 포커스 스타일 */
.file-focus {
	outline: 1px dotted #d2310e;
	/* float:left; */
}

/* 파일업로드 */
.input-file {
	/* display: inline-block; */
	width: 100%;
}

.input-file [type="file"] {
	position: absolute;
	width: 100%;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0 none;
}

.input-file .filelabel {
	/* display: inline-block; */
	/* min-width: 53px; */
	height: 40px;
	line-height: 40px;
	padding: 0 0px;
	border-radius: 2px;
	font-size: 13px;
	/* background-color: #333; */
	/* color: #fff; */
	text-align: center;
	width: 80px;
}

.input-file .filename {
	width: 50%;
	background: #f5f5f5;
	height: 40px;
	line-height: 26px;
	text-indent: 5px;
	border: 1px solid #bbb;
} /* 접근성 탭 포커스 스타일 */
.file-focus {
	outline: 1px dotted #d2310e;
	/* float:left; */
}

#hot3upload > input {
	border: none;
	background-color: red;
}

.hot3imgfile {
	margin-bottom: 10px;
	background-color: blue;
}

@media screen and (max-width: 750px) {
	.cbInsertrow {
		margin: 0px auto;
		width: 100%;
	}
	.cbInsert_div {
		margin: 0px auto;
		text-align: center;
	}
	.cbInsert_check {
		width: 60%;
	}
	.checkbox-wrap {
		margin: 0px;
		font-size: 10px;
	}
	.checkbox-wrap .check-icon {
		width: 20px;
		height: 20px;
		background-size: 20px;
	}
	.cbInsert_btn {
		height: 30px;
		width: 60px;
		font-size: 14px;
	}
	.hot3chk {
		font-size: 10px;
		width: 100%;
		margin: 2px 0px;
	}
}
</style>
<script type="text/javascript">
	function getSelectValue(frm)
	{
		$(".con").css("display", "none");
		var selno = frm.selectBox.options[frm.selectBox.selectedIndex].text;
		$("#con"+selno).css("display", "block");
		$("#cb_no").val(selno);
	}
</script>
</head>
<body>
	<div class="container">
		<div class="row cbInsertrow">
			<div style="height: 50px"></div>
			<div style="height: 120px">
				<h1>점포삭제</h1>
			</div>
			<form name="fileForm" action="hot3delete_ok.do" method="post">
				<input type="hidden" id="cb_no" name="cb_no" value="0"/>
				
				<div class="text-left">
					<label>가게번호</label>
				</div>
				<div class="cbInsert_div">
					<select name="selectBox" onChange="getSelectValue(this.form);" 
					class="cbInsert_input form-control" >
						<option>선택</option>
					<c:forEach var="vo" items="${mycb}">
						<option value="${vo.cb_name}">
						${vo.cb_no}</option>
					</c:forEach>
					</select>
					<br>
				</div>

				<c:forEach var="vo" items="${mycb}">
					<div id="con${vo.cb_no}" class="con" style="display: none">
						<div class="text-left">
							<label>가게명</label>
						</div>
						<div class="cbInsert_div">
							<input type="text" id="hot3name${vo.cb_no}"
								name="hot3name${vo.cb_no}" value="${vo.cb_name}" size="50px"
								class="cbInsert_input form-control" />
						</div>
						<br>
					</div>
				</c:forEach>

				<div class="cbInsert_div text-center cbInsert_check">
					<input type="submit" value="삭제" class="btn cbInsert_btn">&nbsp;
					<input type="button" value="취소" class="btn cbInsert_btn"
						onclick="javascript:history.back()">
				</div>
			</form>
		</div>
	</div>
	<div style="height: 50px"></div>
</body>
</html>