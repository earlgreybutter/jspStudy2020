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
response.setHeader("pragma","no-cache");
if(request.getProtocol().equals("HTTP/1.1")){
	response.setHeader("cache-Control", "no-store");
}
%>
<h1>Response Example1</h1>
http://localhost/myapp/ch07/response1.jsp가<p/>
http://localhost/myapp/ch07/response1_1.jsp로 변경이 되었습니다.
</body>
</html>