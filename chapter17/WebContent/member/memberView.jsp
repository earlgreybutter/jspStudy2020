<%@page import="member.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="mMgr" class="member.MemberMgr"/>
    <%
    request.setCharacterEncoding("UTF-8");
    String id = (String)session.getAttribute("idKey");
    MemberBean membn = mMgr.getMember(id);
    %>
	<%
    String pwd = membn.getPwd();
    String name = membn.getName();
    String gender = membn.getGender();
    String birthday = membn.getBirthday();
    String email = membn.getEmail();
    String zipcode = membn.getZipcode();
    String address = membn.getAddress();
    String hobby = "hobby";
    String job = membn.getJob();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%=id %>의 회원정보</title>

</head>
<body bgcolor="#FFFFCC">
    
<div align="center">
	<br/><br/>
	<form name="regFrm" method="post" action="login.jsp">
	<table align="center" border="0" cellspacing="0" cellpadding="5" >
	<tr>
	<td align="center" valign="middle" bgcolor="#FFFFCC">
	<table border="1" cellspacing="0" cellpadding="2" align="center" width="600">
		<tr align="center" bgcolor="#996600">
			<td colspan="3"><font color="#FFFFFF"><b><%=id%>님의 회원정보</b></font></td>
		</tr>
		<tr>
			<td width="20%">아이디</td>
			<td width="80%"><%=id%></td>
		</tr>
		<tr>
			<td>패스워드</td>
			<td><%=pwd%></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=name%></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><%=gender %></td>
		</tr>
		<tr>
			<td>생년월일</td>
			<td><%=birthday%></td>
		</tr>
		<tr>
			<td>이메일</td>
			<td><%=email %></td>
		</tr>
		<tr>
			<td>우편번호</td>
			<td><%=zipcode%></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=address%></td>
		</tr>
		<tr>
			<td>취미</td>
			<td><%=hobby%></td>
		</tr>
		<tr>
			<td>직업</td>
			<td><%=job %></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="button" value="확인완료" onclick="location.href='../member/login.jsp'">
			</td>
		</tr>
	</table>
	</td>
	</tr>
	</table>
	</form>
</div>
</body>
</html>