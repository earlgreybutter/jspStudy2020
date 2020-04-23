<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR" errorPage="error.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
		int one = Integer.parseInt(request.getParameter("one"));
		int zero = Integer.parseInt(request.getParameter("zero"));
	%>
	<%--http://localhost:8888/chapter06/directive3.jsp?one=5&zero=1 --%>
	<h1>Directive Example3</h1>
	one과 zero의 사칙연산
	<p />
	one+zero=<%=one + zero%><p />
	one-zero=<%=one - zero%><p />
	one*zero=<%=one * zero%><p />
	one/zero=<%=one / zero%><p />
</body>
</html>