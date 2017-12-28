<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYZZIM</title>
<style type="text/css">
	.zzim{
		border: 1px solid skyblue;
		width: 100%;
		height: 290px;
	}
	.mygeul{	
		border: 1px solid skyblue;
		width: 100%;
		height: 290px;
	}
	@media all and (max-width:770px) {
		.tablehit{
			display: none;
		}
	}
</style>
<script type="text/javascript">
	$(function(){
		$("#myboard").css({
			"color": "white", "background-color": "#262626"
		});
	});
</script>
</head>
<body>
	<div>
		<h4><img alt="like" src="member/image/m_zzim.png" width="25px">&nbsp;찜 목록</h4>
	</div>
	<div class="zzim">
		<table class="table" style="clear: both;">
			<tr>
				<th width="15%" class="text-center">번호</th>
				<th width="55%" class="text-left">제목</th>
				<th width="20%" class="text-center">등록날짜</th>
				<th width="10%" class="text-center tablehit">조회수</th>
			</tr>
			<c:forEach var="i" begin="1" end="5">
			<tr>
				<td width="15%" class="text-center">${i }</td>
				<td width="55%" class="text-left">제목${i }</td>
				<td width="20%" class="text-center">날짜${i }</td>
				<td width="10%" class="text-center tablehit">${i }</td>
			</tr>
		</c:forEach>
		</table>
		<table class="table">
			<tr>
				<td class="text-center" colspan="4">
       				<a href="#">&lt;</a>&emsp;
       				<c:forEach var="i" begin="1" end="10">
       					&nbsp;<a href="#">${i }</a>&nbsp;
      				</c:forEach>&emsp;
       				<a href="#">&gt;</a>
       			</td>
       		<tr>
       	</table>
	</div>
	<div>
		<h4><img alt="board" src="member/image/m_table.png" width="25px">&nbsp;내가 쓴 글</h4>
	</div>
	<div class="mygeul">
		<table class="table">
			<tr>
				<th width="15%" class="text-center">번호</th>
				<th width="55%" class="text-left">제목</th>
				<th width="20%" class="text-center">등록날짜</th>
				<th width="10%" class="text-center tablehit">조회수</th>
			</tr>
			<c:forEach var="i" begin="1" end="5">
			<tr>
				<td width="15%" class="text-center">${i }</td>
				<td width="55%" class="text-left">제목${i }</td>
				<td width="20%" class="text-center">날짜${i }</td>
				<td width="10%" class="text-center tablehit">${i }</td>
			</tr>
			</c:forEach>
		</table>	
		<table class="table">
			<tr>
				<td class="text-center" colspan="4">
        			<a href="#">&lt;</a>&emsp;
               		<c:forEach var="i" begin="1" end="10">
                  		&nbsp;<a href="#">${i }</a>&nbsp;
               		</c:forEach>&emsp;
               		<a href="#">&gt;</a>
               	</td>
            <tr>
		</table>
	</div>	
</body>
</html>