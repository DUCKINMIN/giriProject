<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>hot3list</title>
<style type="text/css">
.hot3list {
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

.hot3content {
	padding-top: 50px;
	margin-bottom: 30px;
	background-color: rgba(38, 38, 38, 0.6);
	z-index: 1;
}

.hot3content:hover {
	cursor: pointer;
}

.hot3cb_name, .hot3cb_content {
	color: white;
	margin: 0px auto;
	padding: 10px 10px;
	text-align: center;
	font-size: 34px;
}

.hot3cb_content {
	width: 40%;
	font-size: 22px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

.hot3cb_hit {
	color: white;
	padding: 5px 10px;
	text-align: right;
	font-size: 26px;
}

@media screen and (max-width: 750px) {
	.hot3content {
		padding-top: 20px;
		margin-bottom: 10px;
	}
	.hot3content:hover {
		cursor: pointer;
	}
	.hot3cb_name, .hot3cb_content {
		font-size: 24px;
	}
	.hot3cb_content {
		width: 60%;
		font-size: 12px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
	}
	.hot3cb_hit {
		text-align: right;
		font-size: 12px;
	}
}
</style>
</head>
<body>
		<c:forEach var="vo" begin="0" end="4">
			<div class="hot3list"
				style="background-image: url('../hot3/image/hot3list.jpg')">
				<div class="hot3content" onclick="location.href='../main/hot3main.jsp'">
					<p class="hot3cb_name">옥타곤</p>
					<p class="hot3cb_content">강남 클럽 4위라고 무시하면 안되는거 아시죠^^ 옥타곤에서 크게 놀아봐요</p>
					<p class="hot3cb_hit">
						<img src="../hot3/image/hot3hit.png">&nbsp;1203&nbsp;&nbsp;
						<img src="../hot3/image/hot3cart.png">&nbsp;921
					</p>
				</div>
			</div>
		</c:forEach>
</body>
</html>