<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id = "test" class="ch09.SimpleBean" scope="page"/>
    <jsp:setProperty name="test" property="message" value="빈은 bean"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>간단한 bean programming</h1>
<br/>
Message : <jsp:getProperty property="message" name="test"/>
</body>
</html>