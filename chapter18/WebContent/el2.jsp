<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page isELIgnored="true" %>
    <%
    request.setAttribute("siteName", "www.google.com");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expression Language</title>
</head>
<body>
<h2>EL의 기본문법</h2>
사이트명 : <b>${siteName}</b>
</body>
</html>