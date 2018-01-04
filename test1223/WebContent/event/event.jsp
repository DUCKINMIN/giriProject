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
			<h1>�̺�Ʈ</h1>
			<%--���� --%>
			<ul class="nav nav-tabs nav-justified">
			<li class="nav-item">
			<a class="nav-link active" href="event.do">��ü</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" href="ongoingEvent.do">������</a>
			</li>
			<li class="nav-item">
			<a class="nav-link active" href="endEvent.do">����</a>
			</li>
			</ul>
		</div>
		
		<%--�̺�Ʈ ��� --%>
		<div style="height:30px;"></div>
			
		<div class="row">
		<c:set var="i" value="0"/>
		<c:forEach var="vo" items="${list }">
		  <div class="col-sm-6 col-md-4"  >
		    <div class="thumbnail" data-toggle="modal" data-target="#myModal_${i}" style="overflow-y:hidden;" >
		      <%-- <img src="${vo.e_picture }" alt="�̺�Ʈ"  style="max-width:100%; max-height:100%;"  > --%>
		      <img src="event/eventImage/${vo.e_no }.jpg" alt="�̺�Ʈ" style="width:100%;  height:300px;">
		      <div class="caption">
		        <h2 style="color:white; margin-left:10px;">${vo.e_name}</h2>
		      </div>
		    </div>
		 </div>
		 
		<!-- Modal -->
		  <!-- ��� �˾� ������ --> 
		  
		  <div class="modal fade" id="myModal_${i}" tabindex="-1" 
		   role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" > 
		    <div class="modal-dialog modal-lg"> 
		     <div class="modal-content"> 
		       <div class="modal-header">
		       <button type="button" class="close" data-dismiss="modal">
		       	<img alt="������" src="event/image/exit.png">
		       </button>
		  	   <h4 class="modal-title" id="myModalLabel">��������</h4> 
		  	   </div> 
		  	   
		       <!--��� �� <div class="modal-body">  -->
		       
		       	<div id="content1" style="float:left; width: 52%; padding:10px;">
					<img id="ePic" src="event/eventImage/${vo.e_no }.jpg" alt="�̺�Ʈ">
				</div>
				<div id="content2" style="float: left; width: 47%; padding:10px;">
					<table class="table">
							<div style="float:left; width: 70%; padding:10px;">
							<h4>${vo.e_name }</h4>
							</div>
							<div class="text-right" style="float:left; width: 30%; padding:10px;">
								<img id="interest" alt="����" src="event/image/interest.png" style="width:35px; height:auto;">
							</div>
		      				<tr>
		      					<th class="text-center" width="20%">�����̸�</th>
		      					<td width="80%">${vo.cb.cb_name }</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">�ּ�</th>
		      					<td width="80%">${vo.cb.a_addr1 } ${vo.cb.a_addr2 }</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">�Ͻ�</th>
		      					<td width="80%">
		      					${vo.e_regdate }~${vo.e_enddate }	</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" id="modal_content" width="20%">����</th>
		      					<td width="80%">${vo.e_content }</td>
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">������Ȳ</th>
		      					<td width="80%">
		      						<div class="col-sm-6" style="font-size:13px;">
		      						<img alt="����������" src="event/image/men.png" 
		      							style="width:50px; height:50px;">
		      							&nbsp;&nbsp;����:10��
		      							</div>
		      						<div class="col-sm-6" style="font-size:13px;">
		      						<img alt="����������" src="event/image/women.png">
		      							&nbsp;����:10��
		      						</div>
		      					</td>
		      					
		      				</tr>
		      				<tr>
		      					<th class="text-center" width="20%">����</th>
		      					<td width="80%">���� : 200��</td>
		      				</tr>
		      			</table>	
				</div>
		   		<!-- </div> -->
		   		<div class="modal-footer" >
		   			<div class="text-center" > 
		   				<button type="button" class="btn btn-lg" style="background-color:#AF4848">����</button>
		   			</div> 
		   		 </div>
		  	   
		  	  </div>
		   	 </div>
		   </div>
		   
		   <c:set var="i" value="${i+1}"/>
		   
		  </c:forEach> 
		   
	     </div>
	   
	   <%--������ ��ȣ --%>
	  
	  <div id="board_page" style="float:left; width: 75%; margin:30px 0px 30px 0px">
            <center>
               <a href="event.do?page=${curpage>1?curpage-1:curpage }"><</a>&nbsp;&nbsp;&nbsp;
              	<c:forEach var="i" begin="1" end="${totalpage}" >
                  <a href="event.do?page=${i }">[${i }]</a>&nbsp;
                 </c:forEach>
               
               &nbsp;&nbsp;&nbsp;<a href="event.do?page=${curpage<totalpage?curpage+1:curpage }">></a>
            </center>
         </div>  
	     
	  	<%--�̺�Ʈ ��� ��ư --%>
	  	<c:if test="${grade==1 || grade==2 }">
		<div class="text-center" style="float:left; width: 20%; 
				 margin-top:20px;"> 
		   	<button type="button" class="btn btn-lg btn-info" 
		   			style="background-color:rgb(162,0,0); border:1px solid rgb(162,0,0);">
		   		<a href="eventRegist.do" style="text-decoration:none;
		   				 color:white;">�̺�Ʈ ���</a>
		   				 
			</button>
		</div>
		</c:if> 
	  </div>
	    
	  </div>
	  
    

</body>
</html>