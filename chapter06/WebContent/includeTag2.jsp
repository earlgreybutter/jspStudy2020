<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    request.setCharacterEncoding("UTF-8");
    String siteName = request.getParameter("siteName");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Include Tag</h1>
<jsp:include page="includeTagTop2.jsp">
<jsp:param name="siteName" value="JSPStudy.co.kr"/>
</jsp:include>
include Action의 Body입니다. <p/>
<b><%=siteName %></b>
<hr/>
</body>
</html>