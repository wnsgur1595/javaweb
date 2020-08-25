<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	//DB를 사용하지 않고 application Scope를 이용해서 방명록 시스템을 만들었다.
	//Post방식으로 Url 뒤의 parameter를 없애고 싶었지만, 아직 공부중이다.
	if(application.getAttribute("name") == null && request.getParameter("name") != null){
		ArrayList<String> arr = new ArrayList<String>();
		ArrayList<String> arr2 = new ArrayList<String>();
		arr.add(request.getParameter("name"));
		arr2.add((new Date()).toLocaleString());
		application.setAttribute("name", arr);
		application.setAttribute("id", 1);
		application.setAttribute("date", arr2);
	}
	else if(application.getAttribute("name") != null && request.getParameter("name") != null){
		ArrayList<String> arr = (ArrayList<String>)application.getAttribute("name");
		ArrayList<String> arr2 = (ArrayList<String>)application.getAttribute("date");
		arr.add(request.getParameter("name"));
		arr2.add((new Date()).toLocaleString());
		application.setAttribute("name", arr);
		application.setAttribute("date", arr2);
		int a = (int)application.getAttribute("id");
		a++;
		application.setAttribute("id",a);
	}


	if(application.getAttribute("content") == null && request.getParameter("content") != null){
		ArrayList<String> arr = new ArrayList<String>();
		arr.add(request.getParameter("content"));
		application.setAttribute("content", arr);
	}
	else if(application.getAttribute("content") != null && request.getParameter("content") != null){
		ArrayList<String> arr = (ArrayList<String>)application.getAttribute("content");
		arr.add(request.getParameter("content"));
		application.setAttribute("content", arr);
	}
%>
<%
	if(application.getAttribute("name") != null){
		ArrayList<String> arr1 = (ArrayList<String>)application.getAttribute("name");
		ArrayList<String> arr2 = (ArrayList<String>)application.getAttribute("content");
		ArrayList<String> arr3 = (ArrayList<String>)application.getAttribute("date");
		for(int i=0;i<arr1.size();i++){
%>
ID : <%=application.getAttribute("id") %><br>
이름 : <%=arr1.get(i) %><br>
내용 : <%=arr2.get(i) %><br>
날짜 : <%=arr3.get(i) %><br>
<hr><br>
<%
		}
	}
%>

<form method=post action="Guestbook_Get.jsp">
이름 : <input type="text" name="name"><br><br>
내용 : <textarea rows="5" cols="50" name="content"></textarea><br><br>
<input type="submit" value="확인"><br><br>
</form>
</body>
</html>


