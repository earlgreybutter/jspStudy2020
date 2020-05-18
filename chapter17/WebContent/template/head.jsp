<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String id = (String)session.getAttribute("idKey");
    String cPath = request.getContextPath();
    String url = "../member/member.jsp";
    String label = "회원가입";
    
    if(id!=null){
    	url = "../member/memberUpdate.jsp";
    	label = "회원수정";
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>head</title>
</head>
<body>
<table width="1280" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td colspan="5">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr>
	<td height="50">
	<a href="<%=cPath%>/template/index.jsp" target="_parent" onfocus="this.blur();"><img src="../images/logo.jpg" height="50" border="0"></a>
	</td>
	</tr>
	</table>
	</td>
</tr>
<tr>
	<td colspan="5">&nbsp;</td>
</tr>
<tr>
	<td width="250"><a href="../template/main.jsp" target="content"><b>메인페이지</b></a></td>
	<td><font size="3"><a href="<%=url%>" target="content"><b><%=label%></b></a></font></td>
	<td><font size="3"><a href="../board/list.jsp" target="content"><b>게시판</b></a></font></td>
	<td><font size="3"><a href="../poll/pollList.jsp" target="content"><b>투표</b></a></font></td>
</tr>
</table>
</body>
</html>