<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	
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

						<c:if test="${search_name != '' && list.size() !=0}">
							<c:forEach var="vo" items="${list1 }">

								<tr class="table_content">

									<td width=40% class="text-left"><a
										href="cb_detail.do?cb_no=${vo.cb_no }">&nbsp;&nbsp;${vo.cb_name }</a>
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
						</c:if>
					</table>


					<div>
						<c:if test="${search_name == ''|| list1.size()==0}">
							<p style="text-align: center; font-size: 20pt;">검색결과가 없습니다.</p>
						</c:if>

						<c:if test="${search_name != '' && list1.size() !=0}">
							<a
								href="mainsearch.do?p1=${curpage1>1?curpage1-1:curpage1 }&p2=${curpage2 }&p3=${curpage3}&search_name=${search_name }">
								<!-- <img src="main2/img/befor.png" id="before" style="cursor:pointer"> --><
							</a>&nbsp;

						<c:forEach var="i" begin="1" end="${totalpage1<1?1:totalpage1 }">


								<c:if test="${curpage1==i }">
									<font size="4pt"><b>${i }</b></font>
								</c:if>
								<c:if test="${curpage1!=i }">
									<a
										href="mainsearch.do?p1=${i}&p2=${curpage2 }&p3=${curpage3}&search_name=${search_name }"}>${i }</a>
								</c:if>



							</c:forEach>
						&nbsp; <a
								href="mainsearch.do?p1=${curpage1<totalpage1?curpage1+1:curpage1 }&p2=${curpage2 }&p3=${curpage3}&search_name=${search_name }">
								<!-- <img src="main2/img/next.png" id="next" style="cursor:pointer"> -->>
							</a>&nbsp;&nbsp;
						</c:if>
					</div>



				</div>

			</div>

		</div>
	</div>

</body>
</html>