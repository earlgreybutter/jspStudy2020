<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>While</title>
</head>
<body>
	<h1>While Example</h1>
	<%
		request.setCharacterEncoding("EUC-KR");
		String msg = request.getParameter("msg");
		int number = Integer.parseInt(request.getParameter("number"));
		int count = 0;
		while (number > count) {
	%>
	<b><%=msg%></b>
	<br />
	<%
		count++;
		}
	%>
</body>
</html>