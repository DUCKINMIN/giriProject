<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>MYEVENT</title>
<style type="text/css">
.event{
	display:block;
	border: 1px solid skyblue;
	width: 100%;
}
.thumbnail {
	background-color:black;
}
</style>
<script type="text/javascript">
	$(function(){	
		$("#myevent").css({
			"color": "white", "background-color": "#262626"
		});
	});
</script>
</head>
<body>
	<div>
		<h4><img alt="like" src="member/image/m_eve.png" width="25px">&nbsp;���� �̺�Ʈ</h4>
	</div>
	<c:forEach var="i" begin="1" end="6">
		<div class="col-sm-6 col-md-4" >
	    	<a href="#">
	    		<div class="thumbnail">
	      			<img src="member/image/event_poster.jpg" alt="�̺�Ʈ">
	      			<div>
	       				<h2 style="color:white; margin-left:10px;">�̺�Ʈ ����</h2>
	      			</div>
	    		</div>
	    	</a>
	 	</div>
	</c:forEach>
	<div class="text-center" >
        <a href="#">&lt;</a>&emsp;
        <c:forEach var="i" begin="1" end="10">
        	&nbsp;<a href="#">${i }</a>&nbsp;
        </c:forEach>&emsp;
        <a href="#">&gt;</a>
	</div>
</body>
</html>