<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    session.setAttribute("id", "cat");
    application.setAttribute("siteName", "www.google.com");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Language</title>
</head>
<body>
<h2>EL의 Scope3</h2>
<jsp:forward page="scope4.jsp"/>
</body>
</html>