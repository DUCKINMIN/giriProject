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
	$(function() {
		$(".hot3chk").on("click", function() {
			var bc = $(this).css("background-color");
			/* alert(bc); */
			if (bc == "rgb(38, 38, 38)") {
				$(".hot3chk").css("background", "rgb(38, 38, 38)");
				$(".hot3chk").css("transform", "scale(1)");
				$(this).css("background", "rgb(162,0,0)");
				$(this).css("transform", "scale(1.1)");
				$("#cb_grade").val($(this).attr("name"));
			}
		});
		
 		var img_count = $("#img_count");
		var cnt = img_count.val();
		
		$("#hot3inputadd").click(function() { 
			if (cnt < 4)
				cnt = parseInt(cnt) + 1;
			img_count.val(cnt);
			for(var i = 0; i < cnt; i++)
				$("#input-file"+i).css("display","block");
		});
 		$("#hot3inputdel").click(function() {
			if (cnt > -1)
				cnt -= 1;
			img_count.val(cnt);
			$("#input-file"+cnt).css("display","none");
		});
		
/* 		var cnt = img_count.val();
		
		$("#hot3inputadd").click(function() {
			cnt = parseInt(cnt) + 1;
			img_count.val(cnt);
			addInput();
		});
		$("#hot3inputdel").click(function() {
			if (cnt > 0)
				cnt -= 1;
			img_count.val(cnt);
			
			deleteInput();
		}); */
		/* var z = $(this).attr("id");
		alert(z);
		
		if(window.FileReader){
			var filename = $(this)[0].files[0].name;
		} else {
			var filename = $(this).val().split('/').pop().split('\\').pop();
		}
		$("#filename0").val(filename); */
		
		
		$(".fileupload").change(function(){
			var z = $(this).attr("id").substring(6);
			
			if(window.FileReader){
				var filename = $(this)[0].files[0].name;
			} else {
				var filename = $(this).val().split('/').pop().split('\\').pop();
			}
			$("#filename"+z).val(filename);
		});
	});
	
	/* <div class="input-file" id="input-file${i}" width=100% colspan="2" height=50px style="display: none">
	<input type="text" readonly="readonly" class="filename" id="filename${i}" name="filename${i}" />
	<label for="upload${i}" class="filelabel board_btn">사진 업로드</label>
	<input type="file" name="uploadFile" id="upload${i}" class="fileupload"/>
</div> */
	
/* 	
	var arrInput = new Array(1);
	
	var addInput = function addInput() {
		arrInput.push(arrInput.length);
		display();
	};

	var display = function display() {
		document.getElementById('hot3upload').innerHTML = "";
		for (intI = 0; intI < arrInput.length; intI++) {
			document.getElementById('hot3upload').innerHTML += createInput(arrInput[intI]);
		}
	};

	var createInput = function createInput(id) {
		return '<div class="input-file" width=100% colspan="2" height=50px>' +
		'<input type="text" readonly="readonly" class="filename" id="filename'+id+'" name="title" />' +
		'<label for="upload'+id+'" class="filelabel board_btn">사진 업로드</label>' +
		'<input type="file" name="uploadFile" id="upload'+id+'" class="fileupload"/> </div>';
	};

	var deleteInput = function deleteInput() {
		if (arrInput.length > 0) {
			arrInput.pop();
		}
		display();
	}; 
	*/
	
	
	
	/* <div class="input-file" width=100% colspan="2" height=50px>
	<input type="text" readonly="readonly" class="filename" name="title" />
	<label for="upload0" class="filelabel board_btn">사진 업로드</label>
	<input type="file" name="uploadFile" id="upload0" class="fileupload"/> 
</div> 
XHTML

<div class="fileBox">
	<input type="text" class="fileName" readonly="readonly">
	<label for="uploadBtn" class="btn_file">찾아보기</label>
	<input type="file" id="uploadBtn" class="uploadBtn">
</div>

var uploadFile = $('.fileBox .uploadBtn');
uploadFile.on('change', function(){
	if(window.FileReader){
		var filename = $(this)[0].files[0].name;
	} else {
		var filename = $(this).val().split('/').pop().split('\\').pop();
	}
	$(this).siblings('.fileName').val(filename);
});
*/
	

	/* (function($) {
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
	               .find('.filelabel');
	         $btnUpload
	               .on('change',
	                     function() {
	                        var $target = $(this), fileName = $target
	                              .val(), $fileText = $target
	                              .siblings('.filename');
	                        $fileText.val(fileName);
	                     })
	         $btnUpload.on('focusin focusout', function(e) {
	            e.type == 'focusin' ? $label.addClass('file-focus')
	                  : $label.removeClass('file-focus');
	         })
	      })
	   }
	})(jQuery); */

	/* 	function add_item() {
	 // pre_set 에 있는 내용을 읽어와서 처리..
	 var div = document.createElement('div');
	 div.innerHTML = document.getElementById('pre_set').innerHTML;
	
	 document.getElementById('field').appendChild(div);
	 }

	 function remove_item(obj) {
	 // obj.parentNode 를 이용하여 삭제
	 document.getElementById('field').removeChild(obj.parentNode);
	 } */
</script>
</head>
<body>
	<div class="container">
		<div class="row cbInsertrow">
			<div style="height: 50px"></div>
			<div style="height: 120px">
				<h1>점포등록</h1>
			</div>
			<form name="fileForm" action="hot3insert_ok.do" method="post"
				enctype="multipart/form-data">
				<input type="hidden" id="img_count" name="img_count" value="0" />
				<input type="hidden" id="cb_grade" name="cb_grade" value="0"/>
				<div class="text-left">
					<label>email</label>
				</div>
				<div class="cbInsert_div">
					<input type="email" id="hot3email" name="hot3email"
						value="${sessionScope.m_email}" size="50px"
						class="cbInsert_input form-control" readonly="readonly" />
				</div>
				<br>

				<div class="text-left">
					<label>가게명</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3name" name="hot3name"
						placeholder="가게명을 입력하세요." size="50px"
						class="cbInsert_input form-control" />
				</div>
				<br>

				<div class="text-left">
					<label>사업자등록번호</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3crn" name="hot3crn"
						placeholder="ex) 0123456789" class="cbInsert_input form-control"
						size="50px" />
				</div>
				<br>

				<div class="text-left">
					<label>전화번호</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3phone" name="hot3phone"
						placeholder="ex) 01012345678" class="cbInsert_input form-control"
						size="50px" />
				</div>
				<br>

				<div class="text-left">
					<label>이미지</label>&nbsp;&nbsp; 
					<input type="button" class="btn" id="hot3inputadd" value="추가"/> 
					<input type="button" class="btn" id="hot3inputdel" value="삭제"/>
				</div><br>
				<!-- <input type='file' class="hot3imgfile" id='hot3imgfile0' name='hot3imgfile0'/> -->
				<!-- 첨부파일 -->
<!-- 					private String a_addr1;
	private String a_addr2;
	private String cb_content;
	private String cb_open; -->
				<div id="hot3upload">
					<c:forEach var="i" begin="0" end="3">
						<div class="input-file" id="input-file${i}" width=100% colspan="2" height=50px style="display: none">
							<input type="text" readonly="readonly" class="filename" id="filename${i}" name="filename${i}" />
							<label for="upload${i}" class="filelabel board_btn">사진 업로드</label>
							<input type="file" name="uploadFile" id="upload${i}" class="fileupload"/>
						</div>
					</c:forEach>
				</div>
				<br>
				
				<div class="text-left">
					<label>주소1</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3addr1" name="hot3addr1"
						placeholder="ex) 서울 마포구 서교동" class="cbInsert_input form-control"
						size="50px" />
				</div>
				<br>
				
				<div class="text-left">
					<label>주소2</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3addr2" name="hot3addr2"
						placeholder="번지" class="cbInsert_input form-control"
						size="50px" />
				</div>
				<br>
				
				<div class="text-left">
					<label>내용</label>
				</div>
				<div class="cbInsert_div">
					<textarea id="hot3content" name="hot3content" rows="5" cols="50" 
					placeholder="사장님 한마디" class="cbInsert_input form-control"></textarea>
				</div>
				<br>
				
				<div class="text-left">
					<label>영업시간</label>
				</div>
				<div class="cbInsert_div">
					<input type="text" id="hot3open" name="hot3open"
						placeholder="ex) 22:00 - 09:00" class="cbInsert_input form-control"
						size="50px" />
				</div>
				<br>

				<div class="text-left">
					<label>종류</label>
				</div>
				
				<table class="table">
					<tr>
						<td class="text-center"><input type="button" value="클럽"
							class="btn hot3chk" name="0"></td>

						<td class="text-center"><input type="button" value="감성주점"
							class="btn hot3chk" name="2"></td>

						<td class="text-center"><input type="button" value="헌팅술집"
							class="btn hot3chk" name="3"></td>

						<td class="text-center"><input type="button" value="나이트"
							class="btn hot3chk" name="1"></td>
					</tr>
				</table>

				<div class="cbInsert_div text-center cbInsert_check">
					<input type="submit" value="등록" class="btn cbInsert_btn">&nbsp;
					<input type="button" value="취소" class="btn cbInsert_btn"
						onclick="javascript:history.back()">
				</div>
			</form>
		</div>
	</div>
	<div style="height: 50px"></div>
</body>
</html>