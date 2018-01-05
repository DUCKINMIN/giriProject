<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>hot3list</title>
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

.hot3readmore {
	width: 100%;
	text-align: center;
	background: #ddd;
	color: #262626;
	font-size: 18px;
	padding: 10px;
	cursor: pointer;
	transition: 2s;
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
$(function () {
	var limit = 5;
	var max = ${fn:length(list)};
	
	readmore(limit, max);
	
	$(".hot3readmore").click(function (){
		limit += 5;

		readmore(limit, max);
	});
});

var readmore = function readmore(limit, max) {
	for(var i=0; i < limit; i++) {
		$("#hot3"+i).css("display", "block");
	}
	
	if(limit > max) {
		$(".hot3readmore").css("display", "none");
	}
}
</script>
</head>
<body>
		<input type="hidden" value="5" id="limit">
		<c:forEach var="vo" items="${list}" varStatus="status">
			<div class="hot3list" id="hot3${status.index}"
				style="background-image: url('hot3/cb_img/cb_img_${vo.cb_no}_1.jpg'); display: none;">
				<div class="hot3content" onclick="location.href='cb_detail.do?cb_no=${vo.cb_no}'">
					<p class="hot3cb_name">${vo.cb_name}</p>
					<p class="hot3cb_content">${vo.cb_content}</p>
					<p class="hot3cb_hit">
						<img src="hot3/image/hot3star.png">&nbsp;${vo.rating}&nbsp;&nbsp;
						<img src="hot3/image/hot3hit.png">&nbsp;${vo.cb_hit}&nbsp;&nbsp;
						<img src="hot3/image/hot3cart.png">&nbsp;${vo.jjim}
					</p>
				</div>
			</div>
		</c:forEach>
		<p class="hot3readmore">더보기</p>
</body>
</html>