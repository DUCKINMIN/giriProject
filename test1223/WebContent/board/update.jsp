<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
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
<style>
#board_pro {
	background-image: url('member/profile/${sessionScope.m_profile}');
	background-size: 100%;
	border-radius: 50%;
	width: 80px;
	height: 80px;
	float: left;
}

#board_user {
	width: 200px;
	height: 80px;
	margin-left: 100px;
}

#board_user p {
	margin: 0;
}

#board_name {
	font-size: 18px;
	font-weight: bold;
	line-height: 80px;
}

#board_subject {
	/* width:100%; */
	height: 50px;
	border-bottom: 4px solid rgb(162, 0, 0);
}

#board_subTxt {
	text-align: center;
}

#board_subTxt span {
	/* line-height: 40px; */
	font-size: 17px;
	font-weight: bold;
}

#board_subInput {
	width: 100%;
	height: 45px;
	font-size: 18px;
}

#board_content {
	width: 100%;
}

.form-control {
	resize: none;
}

#board_content p {
	font-size: 17px;
}

#board_updateBtn {
	background-color: rgb(162, 0, 0);
	color: white;
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
#fileDiv{
	display: none;
} 

/* 미디어쿼리 */
@media ( max-width : 993px) {
	#board_subTxt {
		width: 10%;
	}
}

@media ( max-width : 511px) {
	#board_subTxt {
		width: 15%;
	}
}

@media ( max-width : 358px) {
	#board_subTxt {
		width: 30%;
	}
}
</style>
<script type="text/javascript">
	$(function() {
		var img_cnt = $('#fileDiv').attr("img_cnt");
		if(img_cnt>0)
			$('#fileDiv').show();
		$('#upload01').on('change', function() {
			var file = $('#upload01').val();
			file = file.trim();
			if(file!="")
				$('#fileDiv').show();
			else
				$('#fileDiv').hide();
			readURL(this);
		});
		$("#board_updateBtn").click(function() {

			//DB에서 NOT NULL이기 때문에
			var subject = $('#board_subInput').val();
			if (subject.trim() == "") {
				$('#board_subInput').focus();
				return;
			}
			var content = $('#b_content').val();
			if (content.trim() == "") {
				$('#b_content').focus();
				return;
			}

			$('#frm').submit(); //데이터 전송

		});
	});
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#myimg').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
</script>
<body>
	<div>
		<div style="height: 20px"></div>
		<!-- 게시판 프로필 -->
		<form action="board_update_ok.do" method="POST" id=frm enctype="multipart/form-data">
			<div id="board_pro"></div>
			<div id="board_user">
				<p id="board_name">${sessionScope.m_nick }</p>
				<input type="hidden" name="m_email" value="${sessionScope.m_email }">
				<input type="hidden" name="grade" value="${vo.b_grade }">
				<input type="hidden" name="b_no" value="${vo.b_no }">
			</div>
			<div style="height: 30px"></div>
			<!-- 게시판 insert -->
			<table id="board_content">
				<tr id="board_subject">
					<td id="board_subTxt" width="7%"><span>글제목</span></td>
					<td width="93%"><input id="board_subInput" name="b_subject" value="${vo.b_subject }"/></td>
				</tr>
				<tr>
					<td height=20px></td>
				</tr>
				<tr>
					<td width=100% colspan="2">
					<textarea class="form-control" rows="15" cols="100%" id="b_content" name="b_content">${vo.b_content }</textarea>
					</td>
				</tr>

				<!-- 첨부파일 -->
				<tr>
					<td class="input-file" width=100% colspan="2" height=50px>
						<!-- <input type="file" class="upload"> --> <input type="text"
						readonly="readonly" class="file-name" name="title" /> <label
						for="upload01" class="file-label board_btn">사진 업로드</label> <input
						type="file" name="uploadFile" id="upload01" class="file-upload"
						onchange="javascript:$('#change').value=this.value" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div style="width: 200px; height: 200px" id="fileDiv" img_cnt=${vo.b_img_cnt }>
							<img id="myimg" src="board/boardImg/board_${vo.b_no }.jpg" width="100%">
						</div>
					</td>
				</tr>
				<!-- 게시판 insert등록버튼 -->
				<tr>
					<td colspan="2" class="text-right" height=30px><input
						id="board_updateBtn" class="btn board_btn" type="button"
						value="수정"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>