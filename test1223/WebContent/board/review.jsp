<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="path/to/js/star-rating.min.js" type="text/javascript"></script>
<style>
.reply_btn, .reply_insert_btn, .re_reply_btn {
   color: #262626;
   background: #fff;
   border: 1px solid #999;
}

.review_btn {
   float: right;
   margin-top: 4px;
}

.reviewlist {
   border-top: 1px solid #ccc;
}

.user_info .board_pro {
   margin-top: 20px;
}

.list_star img {
   width: 110px;
   float: left;
}

.review_insert {
   margin-bottom: 10px;
}

#reply_pro {
   
   background-size: 100%;
   border-radius: 50%;
   width: 40px;
   height: 40px;
   margin: 10px auto;
}

.reply_list {
   border-top: 1px solid #ddd;
   width: 100%;
   background: rgb(247, 247, 247);
}

.reply_content {
   margin-top: 10px;
}

.reply_insert {
   width: 100%;
   border-top: 1px solid #ddd;
   background: rgb(247, 247, 247);
}

.reply_insert tr td textarea {
   resize: none;
}

.reply_btn, .reply_insert_btn {
   margin: 4px 0px;
}
.review {
   margin-bottom: 50px;
}
.mypro{
	background-image: url('member/profile/${sessionScope.m_profile}');
}
#board_page a {
   color : #262626;
}
#reply_page a {
   color : #262626;
}
#reply_page {
   width: 100%;
   border-top: 1px solid #ddd;
   padding: 5px 0px;
   background: rgb(247, 247, 247);
}
@media ( max-width : 570px) {
   .reply_list td:first-child, .reply_insert td:first-child {
      width: 60px;
   }
   .reply_list td:nth-child(2), .reply_insert td:nth-child(2) {
      width: 100px;
   }
   .reply_content_td, .reply_insert td:last-child {
      width: 400px;
   }
}

@media screen and (max-width: 995px) and (min-width: 569px) {
   .reply_list td:first-child, .reply_insert td:first-child {
      width: 20px;
   }
   .reply_list td:nth-child(2), .reply_insert td:nth-child(2) {
      width: 100px;
   }
   .reply_content_td, .reply_insert td:last-child {
      width: 600px;
   }
}
</style>

<script type="text/javascript">
   $(function() {
      //���� ���̱� �����
      $(".reply_wrap").hide();
      $(".reply_btn").click(function() {
            var btn_id = $(this).attr("id");
            btn_id = btn_id.split("_");
            if($(this).html() == "��&nbsp;&nbsp;&nbsp;��") {
               $(this).html("��&nbsp;&nbsp;&nbsp;��");
               $("#reply_" + btn_id[2]).slideUp("500");
            }
            else {
               $("#reply_" + btn_id[2]).slideDown("500");
               $(this).html("��&nbsp;&nbsp;&nbsp;��");
            }
      });
      
      //���ۿ� ��۴ޱ�
      $(".re_reply_btn").click(function() {
         var re_btn_id = $(this).attr("id");
         re_btn_id = re_btn_id.split("_");
         $("#re_content_" + re_btn_id[2]).val("");
         $("#re_content_" + re_btn_id[2]).val(
                "@"+ $("#re_name_" + re_btn_id[2] + "_" + re_btn_id[3]).text() + "   ");
         $("#re_content_" + re_btn_id[2]).focus();
      });
      
      
      
      
   });
</script>

</head>
<body>
   <div class="review">
      <h2>Review</h2>
      <div class="review_insert">
         <form action="reply_new_insert.do" method="post">
            <table>
               <!-- ����� ���� & ���� ���� -->
               <tr>
                  <td width="10%" class="text-center">
                     <div class="mypro board_pro"></div>
                     <div class="pro_name">
                        <!-- ����� �г��� -->
                        <input type="hidden" name="m_email" value="${sessionScope.m_email }">
                        <input type="hidden" name="b_no" value="${vo.b_no }">
                        <input type="hidden" name="review" value="1">
                         ${sessionScope.m_nick }
                     </div>
                  </td>
                  <td width="90%">
                     <textarea class="form-control" rows="5" cols="100%" name="reply_msg"></textarea>
                  </td>
                  
                  <!-- ���� & ��ư -->
               </tr>
               <tr>
               <td class="text-right" colspan="2">
                  <div class="star_insert">
                     <input type="submit" class="btn review_btn"
                        value="��&nbsp;&nbsp;&nbsp;&nbsp;��" />
                  </div>
               </td>
               </tr>
               <tr>
   
               </tr>
            </table>
         </form>

      </div>

      <!-- ���� ����Ʈ -->
      <div class="review_reply">
		 <c:forEach var="reply_vo" items="${cbc_list }" varStatus="i">
            <table class="reviewlist">
               <!-- ����� ���� & ���� -->
               <tr>
                  <td width="10%" class="text-center user_info">
                     <div class="board_pro"></div>
                     <div class="pro_name">
                        <!-- ����� �г��� -->
                        <!-- �ӽ÷� �̸��� -->
                       <%--  ${reply_vo.m_nick } --%>
                        <!-- ����г��� -->
                     </div>
                  </td>
                  <td width="90%" class="text-left">
                     <div class="review_content">
                        <p>
                           <!-- �� ���� ���� �ٳ�Դµ���....<br> ������� �ʹ� ģ���ϼ̴µ� �˹ٻ����� �Ŵ��������� �𸣰�����..<br>
                           �ʹ� ��ģ���߾��...��� ���� ����ٰ� ��� ����ä�� ���Գ׿�..<br> �˹ٻ��� �ƴϸ� �ʹ�
                           ������� ���Դϴ�!!! ���� �泲����׿�!!! �����찳��  -->
                           <%-- ${reply_vo.cbc_content } --%>
                        </p>
                     </div>
                  </td>
               </tr>

               <!-- ���� & ��� ��ư -->
               <tr>
                  <td class="text-right" colspan="2"><span>
                        <!-- �����ϳ�¥ --><%--  ${reply_vo.dbday } --%><!-- 2017-12-11 -->&nbsp;&nbsp;&nbsp;
                        
<%--                         <c:if test="${sessionScope.m_email != reply_vo.m_email  }">
                           <span>�� ��</span>&nbsp;&nbsp;<span>�� ��</span>&nbsp;&nbsp;
                        </c:if> --%>
                        
                  </span> <button class="btn reply_btn" id="reply_btn_${i.index }">��&nbsp;&nbsp;&nbsp;��</button></td>
               </tr>
            </table>
            <!-- ���� ����Ʈ & ���� ��� -->
            <div class="reply_wrap" id="reply_${i.index }">
               <c:forEach var="j" begin="1" end="3">
                  <!-- ���� ����Ʈ -->
                  <table class="reply_list">
                     <!-- ����� ���� & ���� -->
                     <tr>
                        <td widht="3%" class="reply_tab"></td>
                        <td rowspan="2" width="100px"
                           class="text-center user_info reply_user">
                           <div id="reply_pro" style="background-image: url('cb_detail/image/pro.png')"></div>
                           <div class="reply_name" id="re_name_${i.index }_${j }">����г���</div>
                        </td>
                        <td width="87%" class="text-left reply_content_td">
                           <div class="reply_content">
                              <p>�� ���� ��������? �ҹ��� ���ζ����...!!!</p>
                           </div>
                        </td>
                     </tr>

                     <!-- ���� & ��� ��ư -->
                     <tr>
                        <td colspan="2"></td>
                        <td width="87%" class="text-right">
                           <span>
                              <!-- �����ϳ�¥ -->2017-12-15&nbsp;&nbsp;&nbsp;
                           </span> 
							
                           <button class="btn re_reply_btn"  id="re_btn_${i.index }_${j }">��&nbsp;&nbsp;&nbsp;��</button>
                        </td>
                     </tr>
                  </table>
            
               </c:forEach>
                     
               <div id="reply_page">
                     <center>
                        <a href="#"><</a>&nbsp;&nbsp;&nbsp;
                        <c:forEach var="k" begin="1" end="10">
                           <a href="#">${k }</a>&nbsp;
                        </c:forEach>
                        &nbsp;&nbsp;&nbsp;<a href="#">></a>
                     </center>
                  </div>
               <!-- ���� ��� -->
               <table class="reply_insert">
                  <!-- ����� ���� & ���� -->
                  <tr>
                     <td widht="3%" class="reply_tab"></td>
                     <td rowspan="2" width="100px"
                        class="text-center user_info reply_user">
                        <div id="reply_pro" class="mypro"></div>
                        <div class="reply_name"><!-- ����� �г��� -->����г���</div>
                     </td>
                     <td width="87%" class="text-left reply_content_td">
                        <div class="re_content_insert">
                           <textarea class="form-control" rows="2" id="re_content_${i.index }"></textarea>
                        </div>
                     </td>
                  </tr>

                  <!-- ���� & ��� ��ư -->
                  <tr>
                     <td colspan="2"></td>
                     <td width="87%" class="text-right"><input type="button"
                        class="btn reply_insert_btn" value="��&nbsp;&nbsp;&nbsp;��" /></td>
                  </tr>
               </table>
            </div>
         </c:forEach>
         
      </div>
      <div id="board_page">
            <center>
               <a href="#"><</a>&nbsp;&nbsp;&nbsp;
               <c:forEach var="i" begin="1" end="10">
                  <a href="#">${i }</a>&nbsp;
                     </c:forEach>
               &nbsp;&nbsp;&nbsp;<a href="#">></a>
            </center>
         </div>
   </div>
</body>
</html>