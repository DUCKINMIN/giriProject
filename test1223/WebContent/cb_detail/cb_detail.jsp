<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>상세 보기</title>

<!-- fotorama -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.css"
	rel="stylesheet">
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/fotorama/4.6.4/fotorama.js"></script>
	
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67f04f6a2d4c2265113cfcf62f4e82d9&libraries=services"></script>

<link rel="stylesheet" type="text/css" href="css/star.css"/>

<style type="text/css">
#bg_img {
	margin: 0px auto;
	width: 100%;
	height: 480px;
	position: absolute;
	left: 0;
	top: 0;
}

.fotorama {
	margin: 0px auto;
}

.cb_title {
	height: 30px;
	float: left;
	margin-top: 15px;
}

.like_img {
	margin-top: 20px;
	width: 40px;
	margin-left: 20px;
}

.cb_title span {
	color: #fff;
	padding-left: 20px;
	font-size: 35px;
	font-weight: bold;
}

.cb_black {
	background: #000;
	opacity: 0.5;
	width: 100%;
	height: 480px;
	position: absolute;
	left: 0;
	top: 0;
}

.cb_wrap {
	position: relative;
	width: 100%;
	height: 480px;
	left: 0;
	top: 0;
}

.cb_main {
	position: relative;
	z-index: 100
}

.like img, .hit img {
	width: 20px;
}

.rating img {
	width: 70px;
}

.rating h2 {
	margin-bottom: 9px;
}

.like, .rating, .hit {
	padding: 5px 40px;
	height: 100px;
	margin-top: 50px;
	border-left: 6px solid rgb(162, 0, 0);
	margin-bottom: 4px;
}

.hit {
	height: 100px;
	border-right: 6px solid rgb(162, 0, 0);
}

.like b, .rating b, .hit b {
	font-size: 14px;
}

.cb_info_table {
	margin: 0px auto;
}

.cb_detail p {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 60px;
	border-bottom: 2px solid #bbb;
}

.cb_detail {
	margin: 0px auto;
	margin-top: 100px;
	width: 1130px;
}

.map_motel {
	margin-top: 70px;
}

.map h2 {
	font-weight: bold;
	padding-bottom: 10px;
	border-bottom: 2px solid #bbb;
}

.motel {
	margin-top: 70px;
}

.motel h2 {
	font-weight: bold;
	padding-bottom: 10px;
	border-bottom: 2px solid #bbb;
}

.motel .motel_detail .motel_img {
	width: 100%;
	height: 220px;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center;
}

.motel .motel_detail {
	margin-bottom: 10px;
	width: 100%;
	height: 220px;
	position: relative;
	margin-bottom: 20px;
	cursor: pointer;
}

div.motel_info {
	position: absolute;
	width: 100%;
	text-align: center;
	margin: 0px auto;
	top: 30px;
}

div.motel_info h3 {
	color: white;
	font-size: 32px;
	font-weight: bold;
	margin-bottom: 30px;
}

div.motel_info p {
	color: white;
	font-size: 20px;
	margin-top: 12px;
}

.cb_motel_black {
	background: #000;
	opacity: 0.5;
	width: 100%;
	height: 220px;
	position: absolute;
	left: 0;
	top: 0;
}

.review_wrap {
	margin-top: 70px;
}

.review h2 {
	font-weight: bold;
	padding-bottom: 10px;
	border-bottom: 2px solid #bbb;
}

.review_insert {
	width: 100%;
	height: 150px;
}

#board_pro {
	background-image: url('../cb_detail/image/pro.png');
	background-size: 100%;
	border-radius: 50%;
	width: 70px;
	height: 70px;
	margin: 10px auto;
}

.pro_name {
	margin-top: 13px;
}

.profile {
	line-height: 100px;
}

.review_btn {
	width: 100px;
	background: rgb(162, 0, 0);
	color: #fff;
	font-size: 17px;
}

.review_btn:hover, .review_btn:focus {
	color: #fff;
}

.review_insert table {
	width: 100%;
	height: 150px;
}

.review_insert table textarea {
	resize: none;
}

.star img {
	width: 10r0%;
}

.reviewlist {
	width: 100%;
}

.reviewlist th td {
	vertical-align: middle;
	line-height: 100%;
	padding-top: 70px;
}

.review_content {
	margin-left: 20px;
	padding: 20px 0px;
}

.customoverlay {
	width: 120px;
	height: 30px;
	line-height:30px;
	text-align: center;
	background: #262626;
	color:#fff;
	position:relative;
	bottom:54px;
}
.like_img {
	cursor: pointer;
}
@media ( max-width : 509px) {
	.cb_info_table {
		width: 300px;
	}
	.like, .rating, .hit {
		padding: 5px 5px;
	}
	.like h2, .rating h2, .hit h2 {
		font-size: 20px;
		font-weight: bold;
	}
	.cb_detail p {
		font-size: 20px;
	}
}

@media ( max-width : 1100px) {
	.cb_detail {
		width: 90%;
	}
}

</style>

<script type="text/javascript">
$(function() {
	
	//리뷰등록시 리뷰쪽으로 스크롤 옮기기
	if(${review}=="1"){
		$('html, body').animate({
			scrollTop: $('.review_wrap').offset().top
			}, 300);
	}
	
	$(".like_img").click(function() {
		var src = $(this).attr("src");
		$('.like_img').attr("src",src=="cb_detail/image/no_like.png"? "cb_detail/image/like.png" : "cb_detail/image/no_like.png");
	});
	
	// star rating
	var starRating = function(){
	  var $star = $("#cbc_rating_insert"),
	      $result = $star.find("output>strong");
	  $(document)
	    .on("focusin", "#cbc_rating_insert>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", "#cbc_rating_insert>.input", function(){
	    var $this = $(this);
	    setTimeout(function(){
	      if($this.find(":focus").length === 0){
	        $this.removeClass("focus");
	      }
	    }, 100);
	  })
	    .on("change", "#cbc_rating_insert :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", "#cbc_rating_insert label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", "#cbc_rating_insert>.input", function(){
	    var $checked = $star.find(":checked");
	    if($checked.length === 0){
	      $result.text("0");
	    } else {
	      $result.text($checked.next().text());
	    }
	  });
	};
	starRating(); 
	
	//id에 p+(평점*10하기)
	$("#p" + (${cb_map['RATING'] }*10)).prop("checked", true);
	for(var i=1;i<=50;i++) {
		$("[name=star-input]:not(:checked)").attr('disabled','disabled');
	}
	
	$(".motel_detail").click(function() {
		var mt_id = $(this).attr("id");
		mt_id = mt_id.split("_");
		
		geocoder
		.addressSearch(
				$("#mt_addr_" + mt_id[1]).text(),
				function(result, status) {

					//정상완료
					if (status === daum.maps.services.Status.OK) {
						var coords = new daum.maps.LatLng(
								result[0].y, result[0].x);

						//마커표시-가게마커
						var imageSrc = 'cb_detail/image/m_marker.png', // 마커이미지의 주소입니다    
						imageSize = new daum.maps.Size(48,
								52), // 마커이미지의 크기입니다
						imageOption = {
							offset : new daum.maps.Point(
									23, 52)
						}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

						// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
						var markerImage = new daum.maps.MarkerImage(
								imageSrc, imageSize,
								imageOption), markerPosition = new daum.maps.LatLng(
								37.54699, 127.09598); // 마커가 표시될 위치입니다

						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
							map : map,
							position : coords,
							image : markerImage
						// 마커이미지 설정 
						});

						// 마커가 지도 위에 표시되도록 설정합니다
						marker.setMap(map);
						
						//커스텀 오버레이 만들기
						var content = '<div class="customoverlay">'
								+ '<span class="title">' + $("#mt_name_" + mt_id[1]).text() + '</span>'
								+ '</div>';

						var co_coords= new daum.maps.LatLng(
								result[0].y, result[0].x);
						// 커스텀 오버레이를 생성합니다
						var customOverlay = new daum.maps.CustomOverlay(
								{
									map : map,
									position : co_coords,
									content : content,
									yAnchor : 1
								});

						//지도의 중심을 결과 값으로 받은 위치로 이동
						map.setCenter(coords);
					}
				});
		
	});

});
</script>

</head>
<body>
	<div class="container-fluid">

		<div class="cb_main">
			<div id="bg_img"
				style="background-image: url('cb_detail/image/1010.jpg')"></div>
			<div class="cb_black"></div>
			<div class="cb_wrap">
				<div class="cb_title">
					<!-- 가게 이름 -->
					<span>${vo.cb_name }</span>
				</div>
				<div class="cb_like">
					<!-- 찜 아이콘 -->
					<a href="#"><img class="like_img"
						src="cb_detail/image/no_like.png" /></a>
				</div>
				<div data-width="100%" data-height="350px"
					data-transition="crossfade" class="fotorama" data-nav="thumbs"
					data-loop="true" data-autoplay="2000" data-fit="scaledown">
					<!-- 가게 사진 등록한 수 만큼 -->
					<%-- <c:forEach var="i" begin="1" end="${vo.cb_img_cnt }">
						<img src="hot3/cb_img/cb_img_${vo.cb_no }_${i }.jpg">
					</c:forEach> --%>
					<img src="cb_detail/image/123.jpg">
					<img src="cb_detail/image/456.jpg">
					<img src="cb_detail/image/789.png">
					<img src="cb_detail/image/1010.jpg">
				</div>
			</div>
		</div>
	</div>

	<div class="container">
		<div class="cb_info container">
			<!-- 평점/찜/조회수 보여주기 -->
			<table class="cb_info_table">
				<tr>
					<td>
						<div class="rating text-center">
							<h2>
								<c:out value="${cb_map['RATING'] }"/>
								<!-- 평점 -->
							</h2>
							<!-- <img src="cb_detail/image/rating.png"> -->
							<span class="star-input">
								  <span class="input">
								    <c:forEach var="i" begin="1" end="50">
										  		<input type="radio" name="star-input" id="p${i }" value="${i/10}">
										  		<label for="p${i }" style="width: ${i*2}px; z-index:${51-i}">${i/10}</label>
								 	</c:forEach>
								 	<!-- <output for="star-input"><b>0</b>점</output> -->
								 </span>
					 		</span>
							<!-- 별점 들어가는 곳 -->
							<p>
								<b><c:out value="${cb_map['CNT'] }"/>리뷰</b>
							</p>
						</div>
					</td>
					<td>
						<div class="like text-center">
							<h2>
								<c:out value="${cb_map['JJIM'] }"/>
								<!-- 찜갯수 -->
							</h2>
							<img src="cb_detail/image/like.png"><b>찜</b>
						</div>
					</td>
					<td>
						<div class="hit text-center">
							<h2>${vo.cb_hit }</h2>
							<img src="cb_detail/image/hit_icon.png"><b>조회수</b>
						</div>
					</td>
				</tr>
			</table>

			<!-- 가게 상세 설명 -->
			<table class="cb_detail">
				<tr class="cb_detail_addr">
					<td class="text-left" colspan="1"><img
						src="cb_detail/image/map_icon.png">
						<p>${vo.a_addr1} ${vo.a_addr2 }</p></td>
				</tr>
				<tr class="cb_detail_time">
					<td class="text-left"><img src="cb_detail/image/time_icon.png">
						<c:set var="cb_open_close" value="${vo.cb_open }" />
						<p>
							OPEN &nbsp;&nbsp;&nbsp;&nbsp;${fn:substring(cb_open_close,0,5) }<br>
							CLOSE &nbsp;&nbsp;${fn:substring(cb_open_close,8,13) }
						</p></td>
				</tr>
				<tr class="cb_detail_tel">
					<td class="text-left" colspan="2"><img
						src="cb_detail/image/phone_icon.png">
						<p>${vo.cb_tel }</p></td>
				</tr>
				<tr class="cb_detail_intro">
					<td class="text-left" colspan="2"><img
						src="cb_detail/image/text_icon.png">
						<p>${vo.cb_content }</p></td>
				</tr>
			</table>
		</div>
		<div class="container map_motel">
			<div class="map">
				<h2>지도</h2>
				<div id="map" style="width: 100%; height: 300px;"></div>
				<script type="text/javascript"
					src="//dapi.kakao.com/v2/maps/sdk.js?appkey=67f04f6a2d4c2265113cfcf62f4e82d9"></script>
				<script>
					var container = document.getElementById('map');
					var options = {
						center : new daum.maps.LatLng(33.450701, 126.570667),
						level : 2
					};

					var map = new daum.maps.Map(container, options);

					//주소-좌표 변환 객체 생성
					var geocoder = new daum.maps.services.Geocoder();

					//주소로 좌표 검색
					geocoder
							.addressSearch(
									'${vo.a_addr1} ${vo.a_addr2}',
									function(result, status) {

										//정상완료
										if (status === daum.maps.services.Status.OK) {
											var coords = new daum.maps.LatLng(
													result[0].y, result[0].x);

											//마커표시-가게마커
											var imageSrc = 'cb_detail/image/marker1.png', // 마커이미지의 주소입니다    
											imageSize = new daum.maps.Size(48,
													52), // 마커이미지의 크기입니다
											imageOption = {
												offset : new daum.maps.Point(
														23, 52)
											}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.

											// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
											var markerImage = new daum.maps.MarkerImage(
													imageSrc, imageSize,
													imageOption), markerPosition = new daum.maps.LatLng(
													37.54699, 127.09598); // 마커가 표시될 위치입니다

											// 마커를 생성합니다
											var marker = new daum.maps.Marker({
												map : map,
												position : coords,
												image : markerImage
											// 마커이미지 설정 
											});

											// 마커가 지도 위에 표시되도록 설정합니다
											marker.setMap(map);
											
											//커스텀 오버레이 만들기
											var content = '<div class="customoverlay">'
													+ '<span class="title">${vo.cb_name}</span>'
													+ '</div>';

											var co_coords= new daum.maps.LatLng(
													result[0].y, result[0].x);
											// 커스텀 오버레이를 생성합니다
											var customOverlay = new daum.maps.CustomOverlay(
													{
														map : map,
														position : co_coords,
														content : content,
														yAnchor : 1
													});

											//지도의 중심을 결과 값으로 받은 위치로 이동
											map.setCenter(coords);
										}
									});
					
				</script>
			</div>
			<div class="motel">
				<h2>주변 모텔</h2>
				<c:forEach var="mVo" items="${mList }" varStatus="i">
					<div class="motel_detail" id="mt_${i.index }">
						<div class="motel_img"
							style="background-image: url('${mVo.mt_url}');"></div>
						<div class="cb_motel_black"></div>
						<div class="motel_info">
							<h3 id="mt_name_${i.index }">${mVo.mt_name }</h3>
							<p id="mt_addr_${i.index }">${mVo.a_addr1 } ${mVo.a_addr2 }</p>
							<p>${mVo.mt_tel=="x" ? "전화번호 없음" : mVo.mt_tel }</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<!-- 리뷰 -->
		<div class="container review_wrap">
			<jsp:include page="../cb_detail/review.jsp"/>
		</div>
	</div>
</body>
</html>