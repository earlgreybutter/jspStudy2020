<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import="testweb.HelloWorld"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<font size="5" color="red">ó�� �ۼ���  jsp����</font><br>
<%
//1. import�Ѵ�
//2. instanceȭ �Ѵ�
HelloWorld hw = new HelloWorld();
//3. methodȣ���Ѵ�
String insa=hw.insa("ȫ�浿");
//4. ����� ���
out.print(insa+"<br>");
%>
<%=
insa+"<br>"
%>
</body>
</html>