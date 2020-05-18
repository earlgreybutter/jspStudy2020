<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String strTitle = "Earlgreybutter";
    String cPath = request.getContextPath();
    String content = request.getParameter("content");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=strTitle%></title>
</head>
<frameset frameborder="0" framespacing="0" border="0" rows="130,*">
<frame frameborder="0" scrolling="no" resize="no" name="head" src="<%=cPath%>/template/head.jsp"/>
<frameset name="body" frameborder="0" framespacing="0" border="0" rows="*,20">
	<frameset name="main" frameborder="0" framespacing="0" border="0" cols="240,*">
		<frame name="left" marginwidth="0" marginheight="0" frameborder="0" scrolling="no" resize="no" src="<%=cPath%>/template/left.jsp"/>
		<frame name="content" marginwidth="0" marginheight="0" frameborder="0" scrolling="yes" resize="no" src="<%=cPath%>/template/main.jsp"/>
	</frameset>
	<frame name="copy" src="<%=cPath%>/template/copy.jsp" scrolling="no" marginwidth="0" marginheight="0" frameborder="0" noresize/>
</frameset>
</frameset>
</html>