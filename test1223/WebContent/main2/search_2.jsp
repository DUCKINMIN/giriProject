<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

							<th width=40% class="text-center">제목</th>
							<th width=20% class="text-center">이름</th>
							<th width=20% class="text-center">작성일</th>
							<th width=20% class="text-center table_count">조회수</th>

						</tr>
						<!-- for(FreeBoardVO vo:list) 아래랑 같음 -->
						<c:forEach var="item" begin="1" end="5" step="1">

							<tr class="table_content">
								<td width=40% class="text-left"><a href="#">&nbsp;&nbsp;제목</a>
									&nbsp; <%-- <c:if test="${vo.count!=0 }">
								(${vo.count })
							</c:if> --%></td>
								<td width=20% class="text-center">이름</td>
								<td width=20% class="text-center">작성일</td>
								<td width=20% class="text-center table_count">조회수</td>
							</tr>
						</c:forEach>
					</table>
					<table class="table">
						<tr>
							<td class="text-right"><a href="#" class="btn">이전</a>&nbsp;
								pages<a href="#" class="btn">다음</a>&nbsp;&nbsp;</td>
						</tr>
					</table>

				</div>

			</div>
		</div>
	</div>

</body>
</html>