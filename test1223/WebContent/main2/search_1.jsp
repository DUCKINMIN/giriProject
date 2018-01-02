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
					<!-- ����/��/��ȸ�� �����ֱ� -->
					<table class="table">
						<tr class="table_title1">

							<th width=40% class="text-center">���Ը�</th>
							<th width=30% class="text-center">��ġ</th>
							<th width=15% class="text-center">����</th>
							<th width=15% class="text-center table_count">��ȸ��</th>

						</tr>

						<c:forEach var="vo" items="${list }">

							<tr class="table_content">

								<td width=40% class="text-left"><a href="#">&nbsp;&nbsp;${vo.cb_name }</a>
									&nbsp;</td>
								<td width=20% class="text-center">${vo.a_addr1 }</td>
								<td width=20% class="text-center"><c:choose>
										<c:when test="${vo.cb_grade eq '0' }">
     								    Ŭ��
   									</c:when>
										<c:when test="${vo.cb_grade eq '1' }">
     								   ����Ʈ
   									</c:when>
										<c:when test="${vo.cb_grade eq '2' }">
     								   ��������
   									</c:when>
										<c:when test="${vo.cb_grade eq '3' }">
   									���ü���
   									</c:when>


									</c:choose></td>

								<td width=20% class="text-center table_count">${vo.cb_hit }</td>
							</tr>
						</c:forEach>
					</table>


					<div>
						<a href="mainsearch.do?page=${curpage>1?curpage-1:curpage }&search_name=${search_name }">
							<img src="main2/img/befor.png" id="before" style="cursor:pointer"></a>&nbsp;
						 
						<c:forEach  var="i" begin="1" end="${totalpage<1?1:totalpage }">
						<a href = "mainsearch.do?page=${i}&search_name=${search_name }" }>${i }</a>
						</c:forEach>&nbsp; 
						<a href="mainsearch.do?page=${curpage<totalpage?curpage+1:curpage }&search_name=${search_name }">
						<img src="main2/img/next.png" id="next" style="cursor:pointer"></a>&nbsp;&nbsp;
					</div>



				</div>

			</div>

		</div>
	</div>

</body>
</html>