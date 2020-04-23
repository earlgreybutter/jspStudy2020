<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String name = request.getParameter("name");
String bloodType = request.getParameter("bloodType");
%>
<h1>Forward Tag Example2</h1>
<%=name%>님의 혈액형은
<b><%=bloodType %></b>형이고<p/>
수가 적습니다.
</body>
</html>