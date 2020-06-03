<%@page import="java.sql.Connection"%>
<%@page import="my.board.BoardDBBean"%>
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
BoardDBBean dbBean = BoardDBBean.getInstance();
Connection conn = dbBean.getConnection();
%>
<%=conn.toString() %>
</body>
</html>