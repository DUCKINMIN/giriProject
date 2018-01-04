<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

</head>
<style>
.timeranking_wrap {
	margin: 0px auto;
	width: 100%;
	height: 450px;
	border: 2px solid black;
}

#timeranking_title {
	margin: 20px;
}

#timeranking_title span {
	font-size: 30px;
	border-bottom: 4px solid rgb(162, 0, 0);
}

.table_gender, .table_ranking {
	width: 100%;
}

.table_gender {
	margin-bottom: 15px;
}

.timeranking_td {
	text-align: left;
	font-size: 18px;
	height: 30px;
}

.timeranking_th {
	text-align: center;
	font-size: 20px;
}
.timeranking_tdNo{
	text-align: center;
	font-size: 18px;
}

/* 미디어쿼리 */
@media screen and (max-width: 750px) {
	.timeranking_wrap {
		margin: 0px auto;
		height: 300px;
		width: 100%;
	}
	
	#ranking_1,#ranking_2 {
		float: left;
		width: 100%;
	}
}
</style>
<body>
	<div class="timeranking_wrap">
		<div id="timeranking_title">
			<span>실시간 랭킹</span>
		</div>
		<div id="ranking_1">
		<table class="table_ranking">
			<c:forEach var="rvo" items="${list }" varStatus="i">
				<tr>
					<td width=20% class="timeranking_tdNo">${i.index+1 }</td>
					<td width=50% class="timeranking_td">${rvo.cvo.cb_name }</td>
					<td width=30% class="timeranking_td">
						<c:if test="${rvo.cvo.a_addr1.substring(3,5)=='마포'}">홍대</c:if>
						<c:if test="${rvo.cvo.a_addr1.substring(3,5)=='용산'||rvo.cvo.a_addr1.substring(3,5)=='중구'}">이태원</c:if>
						<c:if test="${rvo.cvo.a_addr1.substring(3,5)=='강남'}">강남</c:if>
					</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</body>
</html>