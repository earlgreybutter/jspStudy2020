<%@ page language="java" 
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,java.text.*"%> <!--server가 한글이 있음을 인식   -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%	// jsp코딩영역
	Date date = new Date();	// 날짜 생성
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");	// 모양 바꿈
	String strdate = simpleDate.format(date);
%>
일반적인 HTML페이비 형태입니다.<br>
오늘 날짜는 <%=strdate %>입니다. 
</body>
</html>