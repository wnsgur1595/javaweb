<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<c:redirect url="http://localhost:8080/guestbook/Guestbook_Post.jsp">
	<c:param name="name" value="${param.name }"/>
	<c:param name="content" value="${param.content }"/>
</c:redirect>
</body>

</html>