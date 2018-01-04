<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYEVENT</title>
<style type="text/css">
.event {
	display: block;
	border: 1px solid skyblue;
	width: 100%;
}

.thumbnail {
	background-color: black;
}
</style>
<script type="text/javascript">
	$(function() {
		$("#myevent").css({
			"color" : "white",
			"background-color" : "#262626"
		});
	});
</script>
</head>
<body>
	<div>
		<h4>
			<img alt="like" src="member/image/m_eve.png" width="25px">&nbsp;참여 이벤트
		</h4>
	</div>
	<c:if test="${size==0 }">
		<div style="margin-top: 100px;">
			<p style="text-align: center; font-size: 20pt;">참여한 이벤트가 없습니다.</p>
		</div>
	</c:if>
	<c:if test="${size!=0 }">
		<c:forEach var="vo" items="${list }">
			<div class="col-sm-6 col-md-4">
				<a href="event.do">
					<div class="thumbnail">
						<img src="event/eventImage/${vo.eventcartvo.e_no }.jpg"
							alt="${vo.eventcartvo.e_no }" style="width: 100%; height: 300px;">
						<div>
							<h2 style="color: white; margin-left: 10px;">${vo.eventvo.e_name }</h2>
						</div>
					</div>
				</a>
			</div>
		</c:forEach>
		<table class="table">
			<tr>
				<td class="text-center" colspan="4"><a
					href="myevent.do?page=${curpage>1?curpage-1:curpage }">&lt;</a>&emsp;
					<c:forEach var="i" begin="1" end="${totalpage<1?1:totalpage }">&nbsp;
		       		<a href="myevent.do?page=${i}"> <c:choose>
								<c:when test="${i==curpage }">
									<font size="4pt">${i }</font>
								</c:when>
								<c:otherwise>
									<font color="black">${i }</font>
								</c:otherwise>
							</c:choose>
						</a>
					</c:forEach>&emsp; <a
					href="myevent.do?page=${curpage<totalpage?curpage+1:curpage }">&gt;</a>
				</td>
			<tr>
		</table>
	</c:if>
</body>
</html>