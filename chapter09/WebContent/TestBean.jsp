<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 액션 태그를 통해 bean생성 -->
<jsp:useBean id="mybean" class="ch09.TestBean" scope="page"/>

<!-- setter를 이용하여 data저장 -->
<jsp:setProperty property="name" name="mybean" value="페페"/>
<jsp:setProperty property="age" name="mybean" value="23"/>

<jsp:setProperty property="phone" name="mybean" value="222-3333-4444"/>

<!-- getter를 통하여 호출함 -->
<jsp:getProperty property="name" name="mybean"/><br/>
<jsp:getProperty property="age" name="mybean"/><br/>

<jsp:getProperty property="phone" name="mybean"/><br/>
</body>
</html>