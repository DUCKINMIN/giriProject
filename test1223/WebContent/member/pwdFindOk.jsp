<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${count==0 }">
		<font color=red>��ȭ��ȣ�� �������� �ʽ��ϴ�</font>
	</c:if>
	<c:if test="${count==1 }">
		<font color=red>��ġ�ϴ� ������ �����ϴ�</font>
	</c:if>
	<c:if test="${count==2 }">
		<font color=blue>ã���ô� ��й�ȣ�� ${m_pwd } �Դϴ�</font>
	</c:if>
</body>
</html>