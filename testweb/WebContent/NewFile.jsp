<%@ page language="java" 
	contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*,java.text.*"%> <!--server�� �ѱ��� ������ �ν�   -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%	// jsp�ڵ�����
	Date date = new Date();	// ��¥ ����
	SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");	// ��� �ٲ�
	String strdate = simpleDate.format(date);
%>
�Ϲ����� HTML���̺� �����Դϴ�.<br>
���� ��¥�� <%=strdate %>�Դϴ�. 
</body>
</html>