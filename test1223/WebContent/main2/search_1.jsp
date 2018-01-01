<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(function() {
	$('#before').click(function() {
		/* $.ajax({
			type : "POST",
			url : "theater.do",
			data : {
				"theater_no" : theater_no
			},
			success : function(response) {
				$('#theater_info').html(response);
			}

		}); */
		alert("before")

	});
	$('#next').click(function() {
		
		 $.ajax({
			type : "POST",
			url : "search_1.do",
			data : {
				"page" : page
			},
			success : function(response) {
				/* $('#theater_info').html(response); */
				alert(response);
			}

		}); 
		 alert("next");

	});
});
</script>
</head>
<body>
	<div class="main_jumpo">



		<div class="jumpo_name">
			<div class="state">

				<p>HOT 3</p>
			</div>
			<div class="row">
				<div class="sebu">
					<!-- 평점/찜/조회수 보여주기 -->
					<table class="table">
						<tr class="table_title1">

							<th width=40% class="text-center">가게명</th>
							<th width=30% class="text-center">위치</th>
							<th width=15% class="text-center">유형</th>
							<th width=15% class="text-center table_count">조회수</th>

						</tr>

						<c:forEach var="vo" items="${list }">

							<tr class="table_content">

								<td width=40% class="text-left"><a href="#">&nbsp;&nbsp;${vo.cb_name }</a>
									&nbsp;</td>
								<td width=20% class="text-center">${vo.a_addr1 }</td>
								<td width=20% class="text-center"><c:choose>
										<c:when test="${vo.cb_grade eq '0' }">
     								    클럽
   									</c:when>
										<c:when test="${vo.cb_grade eq '1' }">
     								   나이트
   									</c:when>
										<c:when test="${vo.cb_grade eq '2' }">
     								   감성주점
   									</c:when>
										<c:when test="${vo.cb_grade eq '3' }">
   									헌팅술집
   									</c:when>


									</c:choose></td>

								<td width=20% class="text-center table_count">${vo.cb_hit }</td>
							</tr>
						</c:forEach>
					</table>


					<div>
						<img src="main2/img/befor.png" id="before" style="cursor:pointer">&nbsp; 
						<c:forEach  var="i" begin="1" end="${totalpage<1?1:totalpage }">
						<a>${i }</a>
						</c:forEach>&nbsp; 
						<img src="main2/img/next.png" id="next" style="cursor:pointer">&nbsp;&nbsp;
					</div>



				</div>

			</div>

		</div>
	</div>

</body>
</html>