<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
    isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>Error Page</h1>
다음과 같은 에러가 발생했습니다.<p/>
<%=exception.getMessage() %>

</body>
</html>