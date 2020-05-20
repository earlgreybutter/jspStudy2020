<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> // jstl 사용가능해짐
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
if(true){
	out.println("실행된다.");
}
else{
	out.println("실행안된다.");
}
%>
<c:if test="true">
실행된다.
</c:if>
<c:if test="false">
실행안된다.
</c:if>
</body>
</html>