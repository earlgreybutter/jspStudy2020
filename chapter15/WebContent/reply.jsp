<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <jsp:useBean id="bean" class="ch15.BoardBean" scope="session"/>
    <%
    String nowPage = request.getParameter("nowPage");
    String subject = bean.getSubject();
    String content = bean.getContent();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<br/><br/>
<table width="460" cellspacing="0" cellpadding="3">
	<tr>
		<td bgcolor="#CCCC00" height="21" align="center">답변하기</td>
	</tr>
</table>

<form method="post" action="/chapter15/boardReply">
<table width="600" cellpadding="7">
<!-- view -->
<tr>
<td align="center">
<table border="0">

<tr>
	<td width="20%">성 명</td>
	<td width="80%"><input name="name" size="30" maxlength="20"></td>
</tr>
<tr>
	<td>제 목</td>
	<td><input name="subject" size="50" value=" 답변 : <%=subject%>" maxlength="50"></td>
</tr>
<tr>
	<td>내 용</td>
	<td><textarea name="content" rows="12" cols="50">
	<%=content%>
	==========답변 글을 쓰세요=========
	</textarea></td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><input type="password" name="pass" size="15" maxlength="15"></td>
</tr>
<tr>
	<td colspan="2" height="5"><hr/></td>
</tr>
<tr>
	<td colspan="2">
		<input type="submit" value="답변등록">
		<input type="reset" value="다시쓰기">
		<input type="button" value="뒤로" onclick="history.back()">		
	</td>
</tr>

</table>
</td>
</tr>
</table>
<!-- input들 -->
<input type="hidden" name="ip" value="<%=request.getRemoteAddr()%>">
<input type="hidden" name="nowPage" value="<%=nowPage%>">
<input type="hidden" name="ref" value="<%=bean.getRef()%>">
<input type="hidden" name="pos" value="<%=bean.getPos()%>">
<input type="hidden" name="depth" value="<%=bean.getDepth()%>">
</form>

</div>
</body>
</html>