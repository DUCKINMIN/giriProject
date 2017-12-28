<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

<title>Insert title here</title>

<style type="text/css">
.tContainer{
	width:100%;
	height:auto;
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
	<div class="tContainer">
	<div class="container">
		<div class="row">
		<div style="height:130px"></div>
			<h1>이벤트</h1>
			<%--내비 --%>
			<ul class="nav nav-tabs nav-justified">
			<li class="nav-item">
			<a class="nav-link active" href="#">전체</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" href="#">진행중</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" href="#">종료</a>
			</li>
			</ul>
		</div>
		
		<%--이벤트 목록 --%>
		<div style="height:30px;"></div>
			
		<div class="row">
		
		<c:forEach var="i" begin="1" end="15">
		  <div class="col-sm-6 col-md-4" >
		    <div class="thumbnail" data-toggle="modal" data-target="#myModal" >
		      <img src="../event/image/event_poster.jpg" alt="이벤트">
		      <div class="caption">
		        <h2 style="color:white; margin-left:10px;">이벤트 제목</h2>
		      </div>
		    </div>
		 </div>
		
		<!-- Modal -->
		  <!-- 모달 팝업 설정란 --> 
		  <div class="modal fade" id="myModal" tabindex="-1" 
		   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" > 
		    <div class="modal-dialog modal-lg"> 
		     <div class="modal-content"> 
		       <div class="modal-header">
		       <button type="button" class="close" data-dismiss="modal">
		       	<img alt="나가기" src="../event/image/exit.png">
		       </button>
		  	   <h4 class="modal-title" id="myModalLabel">상세페이지</h4> 
		  	   </div> 
		  	   
		       <!--모달 안 <div class="modal-body">  -->
		       
		       	<div id="content1" style="float:left; width: 52%; padding:10px;">
					<img id="ePic" src="../event/image/event_poster.jpg" alt="이벤트">
				</div>
				<div id="content2" style="float: left; width: 47%; padding:10px;">
					<table class="table">
							<div style="float:left; width: 70%; padding:10px;">
							<h4>이벤트 이름</h4>
							</div>
							<div class="text-right" style="float:left; width: 30%; padding:10px;">
								<img id="interest" alt="관심" src="../event/image/interest.png" style="width:35px; height:auto;">
							</div>
		      				<tr>
		      					<th class="text-center" width="20%">가게이름</th>
		      					<td width="80%">옥타곤</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">주소</th>
		      					<td width="80%">서울 마포구 신촌로 신촌로 블라블라</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">일시</th>
		      					<td width="80%">2017-10-10~2017-10-10</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">내용</th>
		      					<td width="80%">자 이제시작이야 내꿈을 내꿈을 위한여행 피카츄 걱정따윈없어 없어 
		      					내친구과 함께니까 피카피카 걱정따위는 없어 내친구 피카츄 우리가 함께라면
		      					우린 최고야 언제언제 까지나 진실한 마음으로 언제언제 까지나 그날을 위해
		      					피카츄</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">참여현황</th>
		      					<td width="80%">
		      						<div class="col-sm-6">
		      						<img alt="남자참여자" src="../event/image/men.png" 
		      							style="width:40px; height:auto">
		      							&nbsp;&nbsp;현재:10명
		      							</div>
		      						<div class="col-sm-6">
		      						<img alt="여자참여자" src="../event/image/women.png">
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
		   		<div class="modal-footer">
		   			<div class="text-center"> 
		   				<button type="button" class="btn btn-lg" style="background-color:#AF4848">참여</button>
		   			</div> 
		   		 </div>
		  	   
		  	  </div>
		   	 </div>
		   </div>
		   </c:forEach>
		   
	     </div>
	  </div>
	  <%--페이지 번호 --%>
	  
	  <div id="board_page" style="float:left; width: 75%; margin-top:10px;">
            <center>
               <a href="#"><</a>&nbsp;&nbsp;&nbsp;
               <c:forEach var="i" begin="1" end="10">
                  <a href="#">${i }</a>&nbsp;
                     </c:forEach>
               &nbsp;&nbsp;&nbsp;<a href="#">></a>
            </center>
         </div>
         
	  <%-- <div class="text-center" style="float:left; width: 80%; ">
	  <nav>
  		<ul class="pagination">
   		<li>
    	  <a href="#" aria-label="Previous">
        	<span aria-hidden="true">&laquo;</span>
      		</a>
		</li>
			<c:forEach var="i" begin="1" end="10">
	    	<li><a href="#">${i }</a></li>
			</c:forEach>
		<li>
    		<a href="#" aria-label="Next">
	        	<span aria-hidden="true">&raquo;</span>
	    	</a>
    	</li>
		</ul>
		</nav>
	  	</div> --%>
	  	
	  	<%--이벤트 등록 버튼 --%>
		<div class="text-center" style="float:left; width: 20%; 
				 margin-bottom:40px;"> 
		   	<button type="button" class="btn btn-lg btn-info" 
		   			style="background-color:rgb(162,0,0); border:1px solid rgb(162,0,0);">
		   		<a href="../event/eventRegist.jsp" style="text-decoration:none;
		   				 color:white;">이벤트 등록</a>
			</button>
		</div> 
	  </div>
	  
		  
		  
		 
	

</body>
</html>