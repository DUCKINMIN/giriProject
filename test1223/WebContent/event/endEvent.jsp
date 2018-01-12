<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	$('#invalueableEventBtn').click(function(){
		alert("점포 등록이 필요합니다.");
	});
	
	
});                                    
</script>
<style type="text/css">
.tContainer{
	width:100%;
	
}
.container {
	width:70%;
	
	
}

#ePic{
	width:100%;
	height: 100%;
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
	opacity:0.6;
}

#interest:hover {
	cursor:Pointer;
	opacity: 0.8;
}

#board_page {
   width: 500px;
   margin: 0 auto;
   font-size:20px;
}


</style>
</head>
<body>
	<div class="tContainer" >
	<div class="container" >
		<div class="row" >
		<div style="height:50px ;"></div>
			<h1>이벤트</h1>
			<%--내비 --%>
			<ul class="nav nav-tabs nav-justified">
			<li class="nav-item">
			<a class="nav-link active" href="event.do">전체</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" href="ongoingEvent.do">진행중</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" href="endEvent.do">종료</a>
			</li>
			</ul>
		</div>
		
		<%--이벤트 목록 --%>
		<div style="height:30px;"></div>
			
		<div class="row">
		<c:if test="${listSize==0 }">
			<h2 style="text-align: center;">등록된 이벤트가 없습니다.</h2>
			<div style="height:50px"></div>
		</c:if>
		<c:if test="${listSize!=0 }">
		<c:set var="i" value="0"/>
		<c:forEach var="vo" items="${list }">
		  <div class="col-sm-6 col-md-4" >
		    <div class="thumbnail" data-toggle="modal" data-target="#myModal_${i}" >
		      <%-- <img src="${vo.e_picture }" alt="이벤트"  style="max-width:100%; max-height:100%;"  > --%>
		      <img src="event/eventImage/${vo.e_no }.jpg" alt="이벤트"  style="width:100%;  height:300px;"  >
		      <div class="caption">
		        <h2 style="color:white; margin-left:10px;">${vo.e_name}</h2>
		      </div>
		    </div>
		 </div>
		 
		<!-- Modal -->
		  <!-- 모달 팝업 설정란 --> 
		  
		  <div class="modal fade" id="myModal_${i}" tabindex="-1" 
		   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" > 
		    <div class="modal-dialog modal-lg"> 
		     <div class="modal-content"> 
		       <div class="modal-header">
		       <button type="button" class="close" data-dismiss="modal">
		       	<img alt="나가기" src="event/image/exit.png">
		       </button>
		  	   <h4 class="modal-title" id="myModalLabel">상세페이지</h4> 
		  	   </div> 
		  	   
		       <!--모달 안 <div class="modal-body">  -->
		       
		       	<div id="content1" style="float:left; width: 52%; padding:10px;">
					<img id="ePic" src="event/eventImage/${vo.e_no }.jpg" alt="이벤트">
				</div>
				<div id="content2" style="float: left; width: 47%; padding:10px;">
					<table class="table">
							<div style="float:left; width: 70%; padding:10px;">
							<h4>${vo.e_name }</h4>
							</div>
							<div class="text-right" style="float:left; width: 30%; padding:10px;">
								<img id="interest" alt="관심" src="event/image/interest.png" style="width:35px; height:auto;">
							</div>
		      				<tr>
		      					<th class="text-center" width="20%">가게이름</th>
		      					<td width="80%">${vo.cb.cb_name }</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">주소</th>
		      					<td width="80%">
		      					${vo.cb.a_addr1 } ${vo.cb.a_addr2 }</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">일시</th>
		      					<td width="80%">
		      					<fmt:formatDate value="${vo.e_regdate }" pattern="yyyy-MM-dd"/>~
		      					<fmt:formatDate value="${vo.e_enddate }" pattern="yyyy-MM-dd"/>
		      					</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" id="modal_content" width="20%">내용</th>
		      					<td width="80%">${vo.e_content }</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">참여현황</th>
		      					<td width="80%">
		      						<div class="col-sm-6" style="font-size:13px;">
		      						<img alt="남자참여자" src="event/image/men.png" 
		      							style="width:50px; height:50px;">
		      							&nbsp;&nbsp;현재:10명
		      							</div>
		      						<div class="col-sm-6" style="font-size:13px;">
		      						<img alt="여자참여자" src="event/image/women.png">
		      							&nbsp;현재:10명
		      						</div>
		      					</td>
		      					
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">관심</th>
		      					<td width="80%">현재 : 200명</td>
		      				</tr>
		      			</table>	
				</div>
		   		<!-- </div> -->
		   		<div class="modal-footer" >
		   			<div class="text-center" > 
		   				<button type="button" class="btn btn-lg" style="background-color:#AF4848">참여</button>
		   			</div> 
		   		 </div>
		  	   
		  	  </div>
		   	 </div>
		   </div>
		   
		   <c:set var="i" value="${i+1}"/>
		   
		  </c:forEach> 
		   </c:if>
	     </div>
	   
	   <%--페이지 번호 --%>
	  
	  <div id="board_page" style="float:left; width: 75%; margin-top:10px;">
            <center>
               <a href="endEvent.do?page=${eCurpage>1?eCurpage-1:eCurpage }"><</a>&nbsp;&nbsp;&nbsp;
              	<c:forEach var="k" begin="1" end="${eTotalpage}" >
                  <a href="endEvent.do?page=${k }">[${k }]</a>&nbsp;
                 </c:forEach>
               
               &nbsp;&nbsp;&nbsp;<a href="endEvent.do?page=${eCurpage<eTotalpage?eCurpage+1:eCurpage }">></a>
            </center>
         </div>  
	     
	  	<%--이벤트 등록 버튼 --%>
		<c:if test="${grade==1 || grade==2 }">
	  		<c:if test="${cb_no==0 }">
				<div id="invalueableEventBtn" class="text-center" style="float:left; width: 20%; 
						 margin-top:20px;"> 
		   			<button type="button" class="btn btn-lg btn-info" 
		   					style="background-color:#828282;">
		   				이벤트 등록		 
					</button>
				</div>
			</c:if>
			<c:if test="${cb_no!=0 }">
				<div class="text-center" style="float:left; width: 20%; 
						 margin-top:20px;"> 
		   			<button type="button" class="btn btn-lg btn-info" 
		   					style="background-color:rgb(162,0,0); border:1px solid rgb(162,0,0);">
		   				<a href="eventRegist.do" style="text-decoration:none;
		   						 color:white;">이벤트 등록</a>		 
					</button>
				</div>
			</c:if>
			
			
		</c:if> 
	  </div>
	    
	  </div>
	  
    

</body>
</html>