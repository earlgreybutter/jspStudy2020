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
request.setCharacterEncoding("UTF-8");

String season=request.getParameter("season");
String fruit=request.getParameter("fruit");
String id = (String)session.getAttribute("idKey");

String sessionid = session.getId();

int intervalTime = session.getMaxInactiveInterval();

if(id != null) {
%>
	<h1>Session Example1</h1>
	<b><%=id %></b>님이 좋아하는 계절과 과일은
	<p />
	<b><%=season %></b>과
	<b><%=fruit %></b> 입니다.
	<p />

	세션 ID :
	<%=session %><p />
	세션 유지 시간 :
	<%=intervalTime%>초
	<p />
	<%
session.invalidate();
}
else {
	out.println("세션의 시간이 경과 하였거나 다른 이유로 연결할 수 없습니다.<br/> ");
	out.println("session의 시간 경과 또는 다른 이유로 session 객체의 연결이 종료되었습니다.");
}
%>
</body>
</html>