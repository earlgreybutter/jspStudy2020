<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP Poll</title>
</head>
<body bgcolor="#FFFFCC">
<div align="center">
<br/>
<h2>투표 프로그램</h2>
<hr width="60%"/>
<form method="post" action="pollInsertProc.jsp">
<table border="1" width="500">
<tr>
	<td><b>질문</b></td>s
	<td colspan="2"><input type="text" name="question" size="30"></td>
</tr>
<!-- 항목 입력 -->
<tr>
<%
for(int i=1; i<=4; i++){
	out.println("<td>"+(i*2-1)+" : <input type='text' name='item'></td>");
	out.println("<td>"+(i*2)+" : <input type='text' name='item'></td>");
	out.println("</tr>");
	
	if(i==4){
		out.println("");
	}
	else{
		out.println("<tr>");
	}
}
%>
<tr>
	<td>시작일</td>
	<td colspan="2">
		<select name="sdateY">
			<option value="2018">2018
			<option value="2019">2019
			<option value="2020">2020
		</select>
		<select name="sdateM">
		<%
		for(int i=1; i<=12; i++){
			out.println("<option value='"+i+"'>"+i);
		}
		%>
		</select>월
		<select name="sdateD">
		<%
		for(int i=1; i<=31; i++){
			out.println("<option value='"+i+"'>"+i);
		}
		%>
		</select>일
	</td>
</tr>
<tr>
	<td>종료일</td>
	<td colspan="2">
		<select name="edateY">
			<option value="2018">2018
			<option value="2019">2019
			<option value="2020">2020
		</select>
		<select name="edateM">
		<%
		for(int i=1; i<=12; i++){
			out.println("<option value='"+i+"'>"+i);
		}
		%>
		</select>월
		<select name="edateD">
		<%
		for(int i=1; i<=31; i++){
			out.println("<option value='"+i+"'>"+i);
		}
		%>
		</select>일
	</td>
</tr>
<tr>
	<td>복수투표</td>
	<td colspan="2">
		<input type="radio" name="type" value="1" checked="checked">yes
		<input type="radio" name="type" value="0">no
	</td>
</tr>
<tr>
	<td>
		<input type="submit" value="작성하기">
		<input type="reset" value="다시쓰기">
		<input type="button" value="리스트" onclick="javascript:location.href='pollList.jsp'">
	</td>
</tr>
</table>
</form>
</div>
</body>
</html>