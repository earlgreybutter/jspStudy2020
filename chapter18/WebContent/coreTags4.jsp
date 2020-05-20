<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>Core Tags4</h2>
<hr width="150" align="left"/>
<c:import url="http://localhost:8888/chapter18/coreTags2.jsp">
	<c:param name="id" value="racoon"/>
	<c:param name="color" value="orange"/>
</c:import>
<hr width="360" align="left"/>
<c:url var="url1" value="https://www.google.co.kr/">
	<c:param name="q" value="racoon"/>
	<c:param name="safe" value="off"/>
</c:url>
<a href="${url1}">구글에서 racoon 검색 </a>
</body>
</html>