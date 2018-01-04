<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var i=0;
	$('.manageBox').click(function(){
		var no=$(this).attr("value");
		//alert(no);
		if(i==0){
			$('#manage'+no).show();	
			i=1;
		}else{
			$('#manage'+no).hide();
			i=0;
		}

	$('#delBtn').click(function(){
		var answer = confirm('이벤트를 삭제하시겠습니까?'); 
		if(answer){
			$('#delfrm').submit();
		  }else{
		   return false;
		  }
			
	});
		
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
		
		
		<c:forEach var="vo" items="${list }" varStatus="s">
			<form action="eventUpdate.do" method="get">
		  <div value="${vo.e_no }" class="col-sm-6 col-md-4 manageBox"  >
		  <input type="hidden" name="e_no" value="${vo.e_no }">
		    <div class="thumbnail" data-toggle="modal" <%-- data-target="#myModal_${i}" --%> >
		      <img src="event/eventImage/${vo.e_no }.jpg" alt="이벤트" style="width:100%; height:300px; ">
		      <div class="caption">
		        <h2 style="color:white; margin-left:10px;">${vo.e_name }</h2>
		      </div>
		      <div  id="manage${vo.e_no }" align="center" style="display:none;">
		      	<div style="float:left;">
		      	<a href="eventUpdate.do"><input class="btn btn-info" type=submit  value="수정"></a>
		      	</form>
		      	</div>
		      	<div >
		      	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		      	<form action="eventDelete.do" method="get" id="delfrm" style="border:1px solid red;">
		      	<input type="hidden" value="${vo.e_no }" name="e_no">
		      	<input class="btn btn-danger" type="submit" value="삭제" id="delBtn" style="margin-left:10px;">
		      	</form>
		      	</div>
		      	</div>
		    </div>
		 </div>
		   
		
		   
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