<%@ page language="java" 
		contentType="text/html; charset=EUC-KR"
		pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>Chapter05 Test5</h1>
	<%
		for (int i = 1; i <= 9; i++) {
			for (int j = 1; j <= 9; j++) {
	%>
	<%=(i + " * " + j + " = " + i * j)%><br />
	<%
			}
		}
	%>
</body>
</html>