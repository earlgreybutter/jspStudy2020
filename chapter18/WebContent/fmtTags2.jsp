<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL</title>
</head>
<body>
<h2>Formatting Tags2</h2>
<c:set var="num" value="123456789"/>
Core 태그 set 으로 변수 num선언 <br/>
숫자 : <fmt:formatNumber value="${num}" type="number"/><br/>
퍼센트 : <fmt:formatNumber value="${num}" type="percent" groupingUsed="true"/><br/>
달러 : <fmt:formatNumber value="${num}" type="currency" currencySymbol="$"/><br/>
패턴 : <fmt:formatNumber value="${num}" pattern="0,0000" groupingUsed="false"/><p/> // 이거 안됨

<fmt:parseNumber var="i" integerOnly="true" value="123.456"/>
실수를 제외한 정수 : <c:out value="${i}"/>
</body>
</html>