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
		String name = request.getParameter("name");
		String age = request.getParameter("age");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String hobby[] = request.getParameterValues("hobby");
		// 같은 이름이 여러개일때는 getParameterValues로 받는다
		String gender = request.getParameter("gender");
		request.getParameterNames(); //요소이름을 모를때
		session.setAttribute("myKey", name);
		String mykey = (String)session.getAttribute("myKey");
	%>
	<font size="20" color="purple"><%=name%></font>
	<br />
	<font size="13" color="navy"><%=age%></font>
	<br />
	<font size="13" color="navy"><%=address%></font>
	<br />
	<font size="13" color="navy"><%=phone%></font>
	<br />

	<%
		for (int i = 0; i < hobby.length; i++) {
	%>
	<font size="13" color="green"><%=hobby[i]%></font>
	<br />

	<%
		}
	%> <%--디자인 방식 코딩 --%>
	<font size="13" color="brown"><%=gender%></font>
	<br />
	세션 변수값 : <font size="13" color="brown"><%=mykey%></font>
	<br />
</body>
</html>