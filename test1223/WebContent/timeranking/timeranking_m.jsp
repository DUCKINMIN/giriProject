<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css?family=JejuGothic"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
</head>
<style>
.timeranking_wrap {
	margin: 0px auto;
	width: 16%;
	height: 450px;
	border: 1px solid black;
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

/* �̵������ */
@media screen and (max-width: 750px) {
	.timeranking_wrap {
		margin: 0px auto;
		height: 300px;
		width: 95%;
	}
	
	#ranking_1,#ranking_2 {
		float: left;
		width: 50%;
	}
}
</style>
<body>
	<div class="timeranking_wrap">
		<div id="timeranking_title">
			<span>�ǽð� ��ŷ</span>
		</div>
		<div>
			<table class="table_gender">
				<tr>
					<th width=50% class="timeranking_th">���� <img src="../img/triangle-down.png"></th>
					<th width=50% class="timeranking_th">����</th>
				</tr>
<!-- 				<tr>
					<th width=50% class="text-center"><img src="../img/triangle-down.png"></th>
					<th width=50%></th>
				</tr> -->
			</table>
		</div>
		<div id="ranking_1">
		<table class="table_ranking">
			<c:forEach var="i" begin="1" end="5">
				<tr>
					<td width=20% class="timeranking_tdNo">${i }</td>
					<td width=50% class="timeranking_td">Ŭ���̸�</td>
					<td width=30% class="timeranking_td">����</td>
				</tr>
			</c:forEach>
		</table>
		</div>
		<div id="ranking_2">
		<table class="table_ranking">
			<c:forEach var="i" begin="6" end="10">
				<tr>
					<td width=20% class="timeranking_tdNo">${i }</td>
					<td width=50% class="timeranking_td">Ŭ���̸�</td>
					<td width=30% class="timeranking_td">���¿�</td>
				</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</body>
</html>