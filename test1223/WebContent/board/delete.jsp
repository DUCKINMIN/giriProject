<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<center>
		<p>�����Ͻðڽ��ϱ�?</p>
		<a href="board_delete_ok.do?page=${page }&grade=${vo.b_grade}&no=${vo.b_no}"><input
				class="btn board_btn board_contentBtn" type="button" value="����"></a>
		<a href="board_list.do?page=${page }&grade=${vo.b_grade}"><input
				class="btn board_btn board_contentBtn" type="button" value="���"></a>
	</center>
</body>
</html>