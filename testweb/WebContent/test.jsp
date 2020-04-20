<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="testweb.HelloWorld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<font size="5" color="red">처음 작성한  jsp문서</font><br>
<%
//1. import한다
//2. instance화 한다
HelloWorld hw = new HelloWorld();
//3. method호출한다
String insa=hw.insa("홍길동");
//4. 결과를 출력
out.print(insa+"<br>");
%>
<%=
insa+"<br>"
%>
</body>
</html>