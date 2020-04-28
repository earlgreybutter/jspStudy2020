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
String servletInfo = application.getServerInfo();
String mimeType = application.getMimeType("request1.html");

String realPath = application.getRealPath("/");
application.log("application 내부 객체 로그 테스트");
%>
<h1>Application Example</h1>
서블릿 컨테이너의 이름과 버전:<%=servletInfo %><p/>
RequestExample.html의 MIME Type : <%=mimeType %><p/>
로컬 파일 시스템 경로 : <%=realPath %>
</body>
</html>