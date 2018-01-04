<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<%-- 쉐도우박스 --%>
<!-- <link rel="stylesheet" href="../member/shadow/css/shadowbox.css">
<script type="text/javascript" src="../member/shadow/js/shadowbox.js"></script> -->
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
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
<style type="text/css">
	.container{
		height:820px;
	}
	.resultrow{
		margin: 0px auto;
		width: 65%;
	}
	.result_div{
		height: 80px;
	}
	.result_input{
		height: 70px; 
		padding-left: 20px;
		padding-right: 20px;
		font-size: medium;
	}
	
	#label{
		margin-left:10px;
	}
	/* #upload{
		margin:5px;
		
	}
	 */
	#uploadDiv{
		margin:10px;
	}
	
	/* 파일업로드 */
.input-file {
   /* display: inline-block; */
   width: 100%;
}
.board_btn{
      background-color: white;
      border: 1px solid #B4B4B4;
      font-size: 18px;
      border-radius: 10px;
      width: 80px;
      height: 40px;
      padding: 0px;
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
   border-radius: 5px;
   font-size: 13px;
   /* background-color: #333; */
   /* color: #fff; */
   text-align: center;
   width: 80px;
}

.input-file .file-name {
   width: 80%;
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
	
	#comment{
		resize: none;
	}
	.buttonGroup{
		margin-top:100px;
	}
	.result_btn{
		background-color: rgb(162,0,0);
		color: white;
		height: 50px;
		width: 100px;
		font-size:18px;
	}
	
	
	@media screen and (max-width: 750px) {
		.resultrow{
			margin: 0px auto;
			width: 100%;
		}
		.result_div{
			margin: 0px auto;
			width: 360px;
			text-align: center;
		}
		
		.labelDiv{
			text-align:center;
		}
		
		.input-file .file-name {
   			width: 41%;
   		}
		
	}
	
</style>
<script type="text/javascript">
	$(function(){
		$('#gender').click(function(){
		});
		
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row resultrow text-center">
			<div style="height: 50px"></div>
			<div style="height: 90px">
				<h1>이벤트 수정</h1>
			</div>
			<form  action="eventUpdate_ok.do" method="post" enctype="multipart/form-data">
				<div class="result_div">
					<input type="name" id="name" name="name" value="${vo.e_name }" size="50px" class="result_input form-control" required/>
				</div>
				<div class="text-left labelDiv" >
					<label id="label">이벤트 시작일</label>
				</div>
				<div class="result_div">
					<input type="date" id="startDate" name="startDate" value="${vo.e_regdate }" size="60px" class="result_input form-control" required />
				</div>
				<div class="text-left labelDiv">
					<label id="label">이벤트 종료일</label>
				</div>
				<div class="result_div">
					<input type="date" id="closeDate" name="endDate" value="${vo.e_enddate }" size="60px" class="result_input form-control" required />
				</div>
				<div class="text-left labelDiv" >
					<label id="label">이벤트 포스터를 올려주세요</label>
				</div>
				
				<div id="uploadDiv">		   
		            <div class="input-file" width=100% colspan="2" height=50px>
		               <!-- <input type="file" class="upload"> -->
		               <label for="upload" class="file-label board_btn">사진 업로드</label> 
		               <input type="text" readonly="readonly" class="file-name" /> 
		               <input type="file" name="upload" id="upload" class="file-upload" />
		            </div>				
					<!-- <input type="file" name="upload" id="upload" value="포스터 올리기" sytle="color:white; width:100px; height:auto; 
							background-color:#AF4848"> -->
				</div>
				<div class="result_div">
					<textarea class="form-control" rows="7" id="comment" name="content" required/>${vo.e_content }</textarea>
				</div>
				<div class="buttonGroup">
					<input type="submit" value="수정" class="btn result_btn" >
					<input type="button" value="취소" class="btn result_btn" onclick="javascript:history.back()">
				</div>
			</form>
		</div>
	</div>
</body>
</html>

</body>
</html>