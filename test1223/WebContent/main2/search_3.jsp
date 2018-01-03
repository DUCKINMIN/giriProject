<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="main_jumpo">


		<div class="jumpo_name">
			<div class="state">
				<p>썰전</p>
			</div>
			<div class="row">
				<div class="sebu">
					<!-- 평점/찜/조회수 보여주기 -->
					<table class="table">
						<tr class="table_title1">

							<th width=40% class="text-center">제목</th>
							<th width=20% class="text-center">닉네임</th>
							<th width=20% class="text-center">작성일</th>
							<th width=20% class="text-center table_count">조회수</th>

						</tr>
						<!-- for(FreeBoardVO vo:list) 아래랑 같음 -->
						<c:forEach var="vo2" items="${list2 }">

							<tr class="table_content">

								<td width=40% class="text-left">
								<a href="board_content.do?no=${vo2.b_no }&grade=${vo2.b_grade}">
 								&nbsp;&nbsp;${vo2.b_subject }</a></td>

								<td width=20% class="text-center">${vo2.m_nick }</td>
								<td width=20% class="text-center">

 									<fmt:formatDate	value="${vo2.b_regdate }" pattern="yyyy-MM-dd" />
 								</td>
								<td width=20% class="text-center table_count">${vo2.b_hit }</td>
							</tr>
						</c:forEach>
					</table>
					
					<div>
						<a href="mainsearch.do?page=${curpage }&p2=${curpage2>1?curpage2-1:curpage2 }&search_name=${search_name }">
							<img src="main2/img/befor.png" style="cursor:pointer"></a>&nbsp;
						 
						<c:forEach  var="i" begin="1" end="${totalpage2<1?1:totalpage2 }">
						<a href = "mainsearch.do?p2=${i}&search_name=${search_name }" }>${i }</a>
						</c:forEach>&nbsp; 
						<a href="mainsearch.do?page=${curpage }&p2=${curpage2<totalpage2?curpage2+1:curpage2 }&search_name=${search_name }">
						<img src="main2/img/next.png"style="cursor:pointer"></a>&nbsp;&nbsp;
					</div>


				</div>

			</div>
		</div>
	</div>
</body>
</html>