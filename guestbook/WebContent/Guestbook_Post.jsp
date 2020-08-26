<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	//DB를 사용하지 않고 application Scope를 이용해서 방명록 시스템을 만들었다.
	//Post방식으로 Url 뒤의 parameter를 없애고 싶었지만, 아직 공부중이다.
	if(application.getAttribute("name") == null && request.getParameter("name") != null){
		ArrayList<String> arr = new ArrayList<String>();
		ArrayList<String> arr2 = new ArrayList<String>();
		ArrayList<Integer> arr3 = new ArrayList<Integer>();
		arr.add(request.getParameter("name"));
		arr2.add((new Date()).toLocaleString());
		arr3.add(1);
		application.setAttribute("name", arr);
		application.setAttribute("id", arr3);
		application.setAttribute("date", arr2);
	}
	else if(application.getAttribute("name") != null && request.getParameter("name") != null){
		ArrayList<String> arr = (ArrayList<String>)application.getAttribute("name");
		ArrayList<String> arr2 = (ArrayList<String>)application.getAttribute("date");
		ArrayList<Integer> arr3 = (ArrayList<Integer>)application.getAttribute("id");
		arr.add(request.getParameter("name"));
		arr2.add((new Date()).toLocaleString());
		int a = arr3.get(arr3.size()-1);
		a++;
		arr3.add(a);
		application.setAttribute("name", arr);
		application.setAttribute("date", arr2);
		application.setAttribute("id",arr3);
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
		ArrayList<Integer> arr4 = (ArrayList<Integer>)application.getAttribute("id");
		for(int i=0;i<arr1.size();i++){
%>
ID : <%=arr4.get(i) %><br>
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


