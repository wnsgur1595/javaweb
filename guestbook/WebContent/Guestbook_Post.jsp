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
	//DB�� ������� �ʰ� application Scope�� �̿��ؼ� ���� �ý����� �������.
	//Post������� Url ���� parameter�� ���ְ� �;�����, ���� �������̴�.
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
�̸� : <%=arr1.get(i) %><br>
���� : <%=arr2.get(i) %><br>
��¥ : <%=arr3.get(i) %><br>
<hr><br>
<%
		}
	}
%>

<form method=post action="Guestbook_Get.jsp">
�̸� : <input type="text" name="name"><br><br>
���� : <textarea rows="5" cols="50" name="content"></textarea><br><br>
<input type="submit" value="Ȯ��"><br><br>
</form>
</body>
</html>


