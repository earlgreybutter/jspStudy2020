<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h2>Expression Example2</h2>
<%
java.util.Date date = new java.util.Date();
int hour = date.getHours();
int one = 10;
int two = 12;
%>
<%!
public int operation(int i, int j){
	return i>j?i:j;
}
%>
지금은 오전일까요 오후일까요? <%=(hour<12)?"오전 ":"오후" %><p>
one과 two 둘 중에 큰 숫자는? <%=operation(one, two) %>
</body>
</html>