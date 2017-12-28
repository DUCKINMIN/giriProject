<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
	.cbInsertrow{
		margin: 0px auto;
		width: 50%;
	}
	.cbInsert_div{
		height: 90px;
	}
	.cbInsert_input{
		height: 70px; 
		padding-left: 20px;
		padding-right: 20px;
		font-size: medium;
	}
	#phone_btn{
		background-color: rgb(162,0,0);
		color: white;
		height: 70px;
	}
	#gender, #gender2{
		height: 50px;
		background-color: white;
		border: 1px solid gray;
	}
	.cbInsert_btn{
		background-color: rgb(162,0,0);
		color: white;
		height: 50px;
		width: 150px;
		font-size: 20px;
	}
	.checkbox-wrap { cursor: pointer; margin-right: 30px;}
	.checkbox-wrap .check-icon  { display: inline-block; width: 50px; height: 50px; background: url(../hot3/image/hot3check.png) left center no-repeat; vertical-align: middle; transition-duration: .3s; }
	.checkbox-wrap input[type=radio] { display: none; }
	.checkbox-wrap input[type=radio]:checked + .check-icon { background-image: url(../hot3/image/hot3uncheck.png); }
	
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

.input-file .file-label {
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

.input-file .file-name {
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

.input-file .file-label {
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

.input-file .file-name {
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

	@media screen and (max-width: 750px) {
		.cbInsertrow{
			margin: 0px auto;
			width: 100%;
		}
		.cbInsert_div{
			margin: 0px auto;
			text-align: center;
		}
	}
</style>
</head>
<body>
	<div class="container">
		<div class="row cbInsertrow">
			<div style="height: 50px"></div>
			<div style="height: 120px">
				<h1>점포등록</h1>
			</div>
			<form>
				<div class="text-left">
					<label>email</label>
				</div>
				<div class="cbInsert_div">
					<input type="email" id="hot3email" name="hot3email" value="${sessionScope.id}" size="50px" class="cbInsert_input form-control" readonly="readonly"/>
				</div>
				<div class="text-left">
					<label>가게명</label>
				</div>
				<div class="cbInsert_div">
					<input type="password" id="hot3name" name="hot3name" placeholder="가게명을 입력하세요." size="50px" class="cbInsert_input form-control"/>
				</div>
				<div class="text-left">
					<label>사업자등록번호</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3crn" name="hot3crn" placeholder="'―' 없이 입력하세요." class="cbInsert_input form-control" size="50px"/>		
				</div>
				<div class="text-left">
					<label>전화번호</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3phone" name="hot3phone" placeholder="'―' 없이 입력하세요." class="cbInsert_input form-control" size="50px"/>		
				</div>
				<div class="text-left">
					<label>이미지</label>
				</div>
				<div class="cbInsert_div">
					<input type="file" id="hot3img" name="hot3img" class="cbInsert_input form-control" size="50px"/>		
				</div>
				
				<!-- 첨부파일 -->
            <div class="input-file" width=100% colspan="2" height=50px>
               <!-- <input type="file" class="upload"> -->
               <input type="text" readonly="readonly" class="file-name" /> 
               <label for="upload01" class="file-label board_btn">사진 업로드</label> 
               <input type="file" name="" id="upload01" class="file-upload" />
            </div>
				
				
				<div class="text-left">
					<label>종류</label>
				</div>
				<div class="cbInsert_div text-center">
					<label class="checkbox-wrap"><input type="radio" name="hot3grade" value="클럽" checked>클럽<i class="check-icon"></i></label>
					<label class="checkbox-wrap"><input type="radio" name="hot3grade" value="감성주점">감성주점<i class="check-icon"></i></label>
					<label class="checkbox-wrap"><input type="radio" name="hot3grade" value="헌팅술집">헌팅술집<i class="check-icon"></i></label>
					<label class="checkbox-wrap"><input type="radio" name="hot3grade" value="나이트">나이트<i class="check-icon"></i></label>
				</div>
				<!-- <div class="cbInsert_div text-center btn-group btn-group-lg" style="width: 360px">
					<input type="button" id="gender" name="gender" value="남자" class="btn col-xs-6">
					<input type="button" id="gender2" name="gender" value="여자" class="btn col-xs-6">
				</div> -->
				<div class="cbInsert_div text-center">
					<input type="submit" value="가입" class="btn cbInsert_btn" >&nbsp;
					<input type="button" value="취소" class="btn cbInsert_btn" onclick="javascript:history.back()">
				</div>
			</form>
		</div>
	</div>
	<div style="height: 50px"></div>
</body>
</html>