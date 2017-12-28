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
		<font color=red>전화번호가 존재하지 않습니다</font>
	</c:if>
	<c:if test="${count==1 }">
		<font color=red>일치하는 정보가 없습니다</font>
	</c:if>
	<c:if test="${count==2 }">
		<font color=blue>찾으시는 비밀번호는 ${m_pwd } 입니다</font>
	</c:if>
</body>
</html>