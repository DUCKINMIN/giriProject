<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

</head>
<style>
.timeranking_wrap {
	margin: 0px auto;
	width: 100%;
	height: 150px;
	border: 2px solid black;
}

#timeranking_title {
	margin: 20px;
}

#timeranking_title span {
	font-size: 30px;
	border-bottom: 4px solid rgb(162, 0, 0);
}

.table_gender, .table_ranking {
	width: 100%;
}

.table_gender {
	margin-bottom: 15px;
}

.timeranking_td {
	text-align: left;
	font-size: 18px;
	height: 20px;
}

.timeranking_th {
	text-align: center;
	font-size: 20px;
}
.timeranking_tdNo{
	text-align: center;
	font-size: 18px;
}

/* DS */
#content {
 	margin-top: 25px;
    margin-left: 20px;/* 
    padding: 10px; */
    background: #FFF;
}

#rank-list a {
    color: #111;
    font-weight: bold;
    font-size: 18px;
    text-decoration: none;
}

#rank-list a:hover {
    text-decoration: none;
}

#rank-list {
    overflow: hidden;
   /*  width: 160px; */
    height: 20px;
    margin: 0;
}

#rank-list dt {
    display: none;
}

#rank-list dd {
    position: relative;
    margin: 0;
}

#rank-list ol {
    position: absolute;
    top: 0;
    left: 0;
    margin: 0;
    padding: 0;
    list-style-type: none;
}

/* 미디어쿼리 */
@media screen and (max-width: 750px) {
	.timeranking_wrap {
		margin: 0px auto;
		height: 150px;
		width: 100%;
	}
	
	#ranking_1,#ranking_2 {
		float: left;
		width: 100%;
	}
}
</style>
<script type="text/javascript">
$(function() {
    var count = $('#rank-list li').length;
    var height = $('#rank-list li').height();

    function step(index) {
        $('#rank-list ol').delay(2000).animate({
            top: -height * index,
        }, 500, function() {
            step((index + 1) % count);
        });
    }

    step(1);
});
</script>
<body>
	<div class="timeranking_wrap">
		<div id="timeranking_title">
			<span>실시간 랭킹</span>
		</div>
		<div id="ranking_1">
<%-- 		<table class="table_ranking">
			<c:forEach var="rvo" items="${list }" varStatus="i">
				<tr>
					<td width=20% class="timeranking_tdNo">${i.index+1 }</td>
					<td width=50% class="timeranking_td" id="ra${i.index }" name="${rvo.cvo.cb_name }">${rvo.cvo.cb_name }</td>
					<td width=30% class="timeranking_td">
						<c:if test="${rvo.cvo.a_addr1.substring(3,5)=='마포'}">홍대</c:if>
						<c:if test="${rvo.cvo.a_addr1.substring(3,5)=='용산'||rvo.cvo.a_addr1.substring(3,5)=='중구'}">이태원</c:if>
						<c:if test="${rvo.cvo.a_addr1.substring(3,5)=='강남'}">강남</c:if>
					</td>
				</tr>
			</c:forEach>
		</table> --%>
		<div id="content">
            <dl id="rank-list">
                <dt>실시간 급상승 검색어</dt>
                <dd>
                    <ol>
                    	<c:forEach var="rvo" items="${list }" varStatus="i">
                        <li><a href="#">${i.index+1 }위&nbsp; <b style="color:rgb(162,0,0)">${rvo.cvo.cb_name }</b>&nbsp;&nbsp;<c:if test="${rvo.cvo.a_addr1.substring(3,5)=='마포'}">홍대</c:if>
						<c:if test="${rvo.cvo.a_addr1.substring(3,5)=='용산'||rvo.cvo.a_addr1.substring(3,5)=='중구'}">이태원</c:if>
						<c:if test="${rvo.cvo.a_addr1.substring(3,5)=='강남'}">강남</c:if></a></li>
                        </c:forEach>
                    </ol>
                </dd>
            </dl>
        	</div>
		</div>
	</div>
</body>
</html>