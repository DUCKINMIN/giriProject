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

.board_btn {
	background-color: white;
	border: 1px solid #B4B4B4;
	font-size: 18px;
	border-radius: 0%;
	width: 80px;
	height: 40px;
	padding: 0px;
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
$(document).ready(function() {
	$(".hot3chk").on("click", function() {
		$(".hot3chk").css("background", "rgb(38, 38, 38)");
		$(".hot3chk").css("transform", "scale(1)");
		
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
});

   (function($) {
      var $fileBox = null;
      $(function() {
         init();
      })
      function init() {
         $fileBox = $('.input-file');
         fileLoad();
      }
      function fileLoad() {
         $.each($fileBox, function(idx) {
            var $this = $fileBox.eq(idx), $btnUpload = $this
                  .find('[type="file"]'), $label = $this
                  .find('.file-label');
            $btnUpload
                  .on('change',
                        function() {
                           var $target = $(this), fileName = $target
                                 .val(), $fileText = $target
                                 .siblings('.file-name');
                           $fileText.val(fileName);
                        })
            $btnUpload.on('focusin focusout', function(e) {
               e.type == 'focusin' ? $label.addClass('file-focus')
                     : $label.removeClass('file-focus');
            })
         })
      }
   })(jQuery);
</script>
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
				</div><br>
				
				<div class="text-left">
					<label>가게명</label>
				</div>
				<div class="cbInsert_div">
					<input type="password" id="hot3name" name="hot3name" placeholder="가게명을 입력하세요." size="50px" class="cbInsert_input form-control"/>
				</div><br>
				
				<div class="text-left">
					<label>사업자등록번호</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3crn" name="hot3crn" placeholder="'―' 없이 입력하세요." class="cbInsert_input form-control" size="50px"/>		
				</div><br>
				
				<div class="text-left">
					<label>전화번호</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3phone" name="hot3phone" placeholder="'―' 없이 입력하세요." class="cbInsert_input form-control" size="50px"/>		
				</div><br>
				
				<div class="text-left">
					<label>이미지</label>&nbsp;<input type="button" id="uploadAdd" class="btn" value="추가"/>
				</div>
				<!-- 첨부파일 -->
            <div class="input-file">
               <input type="text" readonly="readonly" class="file-name" /> 
               <label for="upload01" class="file-label board_btn">사진 업로드</label> 
               <input type="file" name="" id="upload01" class="file-upload" />
            </div><br>
				
				<div class="text-left">
					<label>종류</label>
				</div>
				<table class="table">
					<tr>
						<td class="text-center">
							<input type="button" value="클럽" class="btn hot3chk" name="club">
						</td>
						
						<td class="text-center">
							<input type="button" value="감성주점" class="btn hot3chk" name="gamsung">
						</td>
						
						<td class="text-center">
							<input type="button" value="헌팅술집" class="btn hot3chk" name="hunting">
						</td>
						
						<td class="text-center">
							<input type="button" value="나이트" class="btn hot3chk" name="night">
						</td>
					</tr>
				</table>
				
				<div class="cbInsert_div text-center cbInsert_check">
					<input type="submit" value="가입" class="btn cbInsert_btn" >&nbsp;
					<input type="button" value="취소" class="btn cbInsert_btn" onclick="javascript:history.back()">
				</div>
			</form>
		</div>
	</div>
	<div style="height: 50px"></div>
</body>
</html>