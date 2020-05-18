<%@page import="poll.PollListBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Vector" %>
    <jsp:useBean id="pMgr" class="poll.PollMgr"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="#FFFFCC">
<div align="center">
	<br/>
	<h2>투표 프로그램</h2>
	<hr width="60%"/>
	<b>설문 폼</b>
	<!-- pollList 폼 자리 -->
	<jsp:include page="pollForm.jsp"/>
	<hr width="60%"/>
	<b>설문 리스트</b>
	<!-- pollList 테이블 자리 -->
	<table>
	<tr>
		<td>
		<table width="500" border="1">
		<tr>
			<td align="center"><b>번호</b></td>
			<td><b>제목</b></td>
			<td><b>시작일~종료일</b></td>
		</tr>
		<%
		Vector<PollListBean> vlist = pMgr.getAllList();
		
		int count = vlist.size();
		
		for(int i=0; i<vlist.size(); i++){
			PollListBean plBean = vlist.get(i);
			int num = plBean.getNum();
			String question = plBean.getQuestion();
			String sdate = plBean.getSdate();
			String edate = plBean.getEdate();
			
			%>
			<tr>
				<td align="center"><%=count%></td>
				<td><a href="pollList.jsp?num=<%=num%>"><%=question%></a></td>
				<td><%=sdate%> ~ <%=edate%></td>
			</tr>
			<%
			count = count-1;
		}
		
		%>
		</table>
		</td>
	</tr>
	<tr>
		<td align="right"><a href="pollInsert.jsp">설문 작성하기</a></td>
	</tr>
	</table>
</div>
</body>
</html>