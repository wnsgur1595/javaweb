<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:redirect url="http://localhost:8080/guestbook/Guestbook_Post.jsp">
	<c:param name="name" value="${param.name }"/>
	<c:param name="content" value="${param.content }"/>
</c:redirect>
</body>

</html>