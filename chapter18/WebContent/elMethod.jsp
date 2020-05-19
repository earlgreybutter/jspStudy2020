<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="/functions.tld" prefix="m" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>EL 정적 메소드</h2>
123456789를 1000단위 구분 기호(,)로 표시하시오.<p/>
<b>result : ${m:comma(123456789)}</b>
</body>
</html>