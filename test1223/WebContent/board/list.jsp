<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
.boardBtn {
	background-color: white;
	border: 1px solid #B4B4B4;
	font-size: 18px;
	border-radius: 0%;
	width: 80px;
	height: 40px;
	padding: 0px;
}


#board_search {
	height: 40px;
	float: left;
	width: 50%;
}

#search {
	margin-top: 10px;
}

#board_searchSel {
	height: 40px;
	width: 80px;
	font-size: 15px;
	align-content: center;
	float: left;
}

#board_ssulBtn {
	float: left;
}

#board_insertBtn {
	float: right;
}

.board-th {
	font-size: 16px;
}

.board-td {
	font-size: 14px;
}

#board_tr:hover {
	background-color: #ededed;
}

.board-td a {
	color: black;
	text-decoration: none;
}

.board-th, .board-td {
	height: 40px;
}

#board_page {
	width: 500px;
	margin: 0 auto;
}

#board_page a {
	color: black;
	text-decoration: none;
	font-size: 15px;
}

@media ( max-width : 993px) {
	.board-th {
		width: 20%;
		font-size: 13px;
	}
	.board-td {
		width: 20%;
		font-size: 13px;
	}
	.board_Tsub {
		width: 25%;
	}
	.board_Tno {
		width: 15%;
	}
	.boardBtn, #board_searchSel {
		width: 50px;
		font-size: 15px;
	}
	#board_page {
		width: 100%;
	}
}
</style>

<body>
	<div>
		<div style="height: 40px"></div>
		<!-- �Խ��� �˻� -->
		<div id="search"><form id="searchFrm" method="POST" action="board_search.do">
			<select id="board_searchSel" name="select">
				<option value="b_subject">������</option>
				<option value="m_nick">�ۼ���</option>
			</select> 
			<input type="text" id="board_search" name="strSearch"/>
			<input type="submit" class="btn boardBtn" value="�˻�">
			<input type="hidden" name="grade" value="${grade }">
			
				<div style="float:right">
				<a href="board_insert.do?grade=${grade}"><input type="button" class="btn boardBtn" value="�۾���"
					id="board_insertBtn"></a>
			</div>
			</form>
		</div>
		
	</div>
	<div class="row">
		<div style="height: 40px"></div>
		<!-- �Խ��� ����Ʈ -->
		<div style="height:440px">
		<table class="table">
			<tr>
				<th width=10% class="text-center board-th board_Tno">��ȣ</th>
				<th width=40% class="text-center board-th board_Tsub">����</th>
				<th width=15% class="text-center board-th">�̸�</th>
				<th width=20% class="text-center board-th">�ۼ���</th>
				<th width=15% class="text-center board-th">��ȸ��</th>
			</tr>
			<c:set var="cnt" value="${cnt-(curpage*10-10)}"></c:set>
			<c:forEach var="vo" items="${list }">
				<tr id="board_tr">
					<td width=10% class="text-center board-td board_Tno">${cnt}</td>
					<td width=45% class="text-left board-td board_Tsub"><a
						href="board_content.do?no=${vo.b_no }&page=${curpage}&grade=${vo.b_grade}">${vo.b_subject }</a></td>
					<td width=15% class="text-center board-td">${vo.m_nick }</td>
					<td width=20% class="text-center board-td"><fmt:formatDate
							value="${vo.b_regdate }" pattern="yyyy-MM-dd" /></td>
					<td width=10% class="text-center board-td">${vo.b_hit }</td>
					<c:set var="cnt" value="${cnt-1}"></c:set>
				</tr>
			</c:forEach>
		</table>
		</div>
		</div>
		<!-- ��ư, ������ -->
		<div style="margin-top:10px">
			<div style="height: 40px"></div>
			<div id="board_page">
				<center>
					<a href="board_list.do?page=${curpage>1?curpage-1:curpage }&grade=${grade}"><</a>&nbsp;&nbsp;&nbsp;
					<c:forEach var="i" begin="1" end="${totalpage }">
						<a href="board_list.do?page=${i}&grade=${grade}">${i }</a>&nbsp;
							</c:forEach>
					&nbsp;&nbsp;&nbsp;<a
						href="board_list.do?page=${curpage<totalpage?curpage+1:curpage }&grade=${grade}">></a>
				</center>
			</div>
		</div>
	
</body>
</html>