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
if(request.getParameter("msg")==null){
	out.print("NULL 입니다.");
}
else if(request.getParameter("msg")==""){
	out.print("empty입니다. ");
}
else {
	out.print("empty도 null도 아닙니다.");
}
%>
</body>
</html>