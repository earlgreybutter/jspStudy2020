<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Declaration Example1</h1>
<%
String name = team+"Fighting!!";
%>
<%!
String team ="Korea";
%>
출력되는 결과는? <%=name %>
</body>
</html>