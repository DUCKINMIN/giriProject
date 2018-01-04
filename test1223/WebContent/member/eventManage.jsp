<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
<script type="text/javascript" src="../js/jquery-2.1.3.min.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function(){
	$('#manageBox').click(function(){
		$('#manage').show();
	});
});
</script>
<style type="text/css">
.tContainer{
	width:100%;
}
.container {
	width:90%;
	
	
}

#ePic{
	width:100%;
	height 100%;
}

/* .navbar-default:hover {
	color:white;
	background-color: blue;
} */

.nav-link {
	color:black;
	font-size: 20px;
}
.modal-content {
	background-color:#646464;
	color:white;
}

.thumbnail {
	background-color:black;
}
.thumbnail:hover {
	cursor:Pointer;
	opacity:0.8;
}



</style>
</head>
<body>
	<div style="height:30px;"></div>
	<div class="tContainer" >
	<div class="container" >
		<div class="row">
		<%-- <c:set var="i" value="0"/> --%>
		<c:forEach var="vo" items="${list }">
		  <div id="manageBox" value="${vo.no }" class="col-sm-6 col-md-4"  >
		    <div class="thumbnail" data-toggle="modal" <%-- data-target="#myModal_${i}" --%> >
		      <img src="event/eventImage/${vo.e_no }.jpg" alt="이벤트" style="width:100%; height:300px; ">
		      <div class="caption">
		        <h2 style="color:white; margin-left:10px;">${vo.e_name }</h2>
		      </div>
		      <div  id="manage" align="center" style="display:none;">
		      	<a href="member/eventUpdate.jsp"><input class="btn btn-info" type=button  value="수정"></a>
		      	<input class="btn btn-danger" type=button value="삭제">
		      </div>
		    </div>
		 </div>
		   
		  <%--  <c:set var="i" value="${i+1}"/> --%>
		   
		  </c:forEach> 
		   
	     </div>
	     </div>
	     </div>
	     <table id="table_content" width="700">
	     	<tr>
	     		<td align=right>
	     		<a href="member_event.do?page=${curpage>1?curpage-1:curpage }">이전</a>&nbsp;
	     		<a href="member_event.do?page=${curpage<totalpage?curpage+1:curpage }">다음</a>&nbsp;&nbsp;
	     		[${curpage }] page / [${totalpage }] pages
	     		</td>
	     	</tr>
	     </table>
	     
</body>
</html>