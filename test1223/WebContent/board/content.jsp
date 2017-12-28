<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
#board_pro {
	background-image: url('image/pro.png');
	background-size: 100%;
	border-radius: 50%;
	width: 80px;
	height: 80px;
	float: left;
}

#board_user {
	width: 200px;
	height: 80px;
	margin-left: 100px;
	padding-top: 8px;
}

#board_user p {
	margin: 0;
}

#board_name {
	font-size: 18px;
	font-weight: bold;
	padding-bottom: 5px;
}

#board_subject {
	height: 40px;
	border-bottom: 2px solid #bbb;
}

#board_subject p {
	/* line-height: 40px; */
	font-size: 17px;
	font-weight: bold;
}

#board_content p {
	font-size: 17px;
}

#board_cotentBtn {
	margin-top: 30px;
	height: 40px;
	width: 100%;
	text-align: right;
}

.board_cotentBtn {
	/* float:right; */
	width: 50px;
	font-size: 15px;
}
</style>
<body>
	<!-- �Խ��� �󼼺��� -->
	<div class="content_wrap">
		<div style="height: 20px"></div>
		<div id="board_pro"></div>
		<div id="board_user">
			<p id="board_name">${vo.m_nick }</p>
			<p id="board_regdate">
				<fmt:formatDate value="${vo.b_regdate }" pattern="yyyy-MM-dd" />
			</p>
			<p id="board_hit">��ȸ�� ${vo.b_hit }</p>
		</div>
		<div style="height: 30px"></div>
		<!-- �Խ��� �󼼺���  ���� -->
		<div id="board_subject">
			<p>${vo.b_subject }</p>
		</div>
		<div style="height: 20px"></div>
		<!-- �Խ��� �󼼺��� ���� -->
		<div id="board_content">
			<p>${vo.b_content }</p>
			<%-- <c:if test="${vo.b_img_cnt>0 }"> --%>
				<p>
					<img width="100%" src="boardImg/board_${vo.b_no }.jpg"/>
				</p>
			<%-- </c:if> --%>
		</div>
		<!-- �Խ��� �󼼺��� ��ư -->
		<div id="board_cotentBtn">
			<input id="board_updateBtn" class="btn board_btn board_cotentBtn"
				type="button" value="����"> <a><input
				class="btn board_btn board_cotentBtn" type="button" value="����"></a>
			<a href="board_list.do?page=${page }&grade=${vo.b_grade}"><input
				class="btn board_btn board_cotentBtn" type="button" value="���"></a>
		</div>
	</div>
	<!-- ���� -->
	<div class="container review_wrap">
		<jsp:include page="../board/review.jsp"></jsp:include>
	</div>

</body>
</html>