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
				<p>Ŀ�´�Ƽ</p>
			</div>
			<div class="row">
				<div class="sebu">
					<!-- ����/��/��ȸ�� �����ֱ� -->
					<table class="table">
						<tr class="table_title1">

							<th width=40% class="text-center">����</th>
							<th width=20% class="text-center">�г���</th>
							<th width=20% class="text-center">�ۼ���</th>
							<th width=20% class="text-center table_count">��ȸ��</th>

						</tr>
						<c:if test="${search_name != '' && list3.size()!=0}">
							<!-- for(FreeBoardVO vo:list) �Ʒ��� ���� -->
							<c:forEach var="vo" items="${list3 }">

								<tr class="table_content">

									<td width=40% class="text-left"><a
										href="board_content.do?no=${vo.b_no }&grade=${vo.b_grade}">
											&nbsp;&nbsp;${vo.b_subject }</a></td>

									<td width=20% class="text-center">${vo.m_nick }</td>
									<td width=20% class="text-center"><fmt:formatDate
											value="${vo.b_regdate }" pattern="yyyy-MM-dd" /></td>
									<td width=20% class="text-center table_count">${vo.b_hit }</td>
								</tr>
							</c:forEach>
						</c:if>
					</table>

					<div>

						<c:if test="${search_name == ''|| list3.size()==0}">
							<p style="text-align: center; font-size: 20pt;">�˻������ �����ϴ�.</p>
						</c:if>
						
						<c:if test="${search_name != '' && list3.size() !=0}">

							<a
								href="mainsearch.do?p1=${curpage1}&p2=${curpage2}&p3=${curpage3>1?curpage3-1:curpage3 }&search_name=${search_name }">
								<</a>&nbsp;

						<c:forEach var="i" begin="1" end="${totalpage3<1?1:totalpage3 }">
								<c:if test="${curpage3==i }">
									<font size="4pt"><b>${i }</b></font>
								</c:if>
								<c:if test="${curpage3!=i }">
									<a
										href="mainsearch.do?p1=${curpage1}&p2=${curpage2 }&p3=${i}&search_name=${search_name }"}>${i }</a>
								</c:if>
							</c:forEach>
						&nbsp; <a
								href="mainsearch.do?p1=${curpage1}&p2=${curpage2 }&p3=${curpage3<totalpage3?curpage3+1:curpage3}&search_name=${search_name }">
								>&nbsp;&nbsp; </a>
						</c:if>
					</div>


				</div>

			</div>
		</div>
	</div>
</body>
</html>