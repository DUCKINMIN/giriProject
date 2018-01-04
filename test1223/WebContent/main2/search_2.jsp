<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<p>이벤트</p>
			</div>
			<div class="row">
				<div class="sebu">
					<!-- 평점/찜/조회수 보여주기 -->
					<table class="table">
						<tr class="table_title1">

							<th width=40% class="text-center">이벤트명</th>
							<th width=20% class="text-center">가게명</th>
							<th width=20% class="text-center">시작일</th>
							<th width=20% class="text-center table_count">종료일</th>
						</tr>
						<!-- for(FreeBoardVO vo:list) 아래랑 같음 -->
						<c:if test="${search_name != '' && list.size() !=0}">
							<c:forEach var="vo" items="${list2 }">
								<tr class="table_content">
									<td width=40% class="text-left"><a href="#">
											&nbsp;&nbsp;${vo.e_name }</a></td>
									<td width=20% class="text-center">${vo.cb.cb_name}</td>
									<td width=20% class="text-center">${vo.e_regdate }</td>
									<td width=20% class="text-center">${vo.e_enddate }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>







					<div>

						<c:if test="${search_name == ''|| list2.size()==0}">
							<p style="text-align: center; font-size: 20pt;">검색결과가 없습니다.</p>
						</c:if>
						<c:if test="${search_name != '' && list2.size() !=0}">

							<a
								href="mainsearch.do?p1=${curpage1 }&p2=${curpage2>1?curpage2-1:curpage2}&p3=${curpage3}&search_name=${search_name }">
								<</a>&nbsp;

						<c:forEach var="i" begin="1" end="${totalpage2<1?1:totalpage2 }">
								<c:if test="${curpage2==i }">
									<font size="4pt"><b>${i }</b></font>
								</c:if>
								<c:if test="${curpage2!=i }">
									<a
										href="mainsearch.do?p1=${curpage1}&p2=${i }&p3=${curpage3}&search_name=${search_name }"}>${i }</a>
								</c:if>
							</c:forEach>
						&nbsp; <a
								href="mainsearch.do?p1=${curpage1 }&p2=${curpage2<totalpage2?curpage2+1:curpage2 }&p3=${curpage3}&search_name=${search_name }">
								>&nbsp;&nbsp; </a>
						</c:if>
					</div>

				</div>

			</div>
		</div>
	</div>

</body>
</html>