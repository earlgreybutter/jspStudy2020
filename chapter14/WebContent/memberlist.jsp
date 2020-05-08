<%@page import="ch14.DBConnectionMgr"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="ch14.MemberBean" %>
    <%@ page import="java.util.*" %>
    <%
    DBConnectionMgr pool = DBConnectionMgr.getInstance();
    
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    String id ="";
	String pwd ="";
	String name ="";
	String gender ="";
	String birthday ="";
	String email ="";
	String zipcode ="";
	String address ="";
	String hobby ="";
	String job ="";
	
	int counter = 0;
	
	try{
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadb","javauser","1234");
		stmt = conn.createStatement();
		rs = stmt.executeQuery("select * from tblmember");
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 정보</title>
</head>
<body bgcolor="#FFFFCC">
<h2>회원정보</h2>
<br/>
<table border="1" bordercolor="brown">
<tr>
	<td><strong>ID</strong></td>
	<td><strong>PWD</strong></td>
	<td><strong>NAME</strong></td>
	<td><strong>GENDER</strong></td>
	<td><strong>BIRTHDAY</strong></td>
	<td><strong>EMAIL</strong></td>
	<td><strong>ZIPCODE</strong></td>
	<td><strong>ADDRESS</strong></td>
	<td><strong>HOBBY</strong></td>
	<td><strong>JOB</strong></td>
</tr>
<%
if(rs!=null){
	while(rs.next()){
		id=rs.getString("id");
		pwd=rs.getString("pwd");
		name=rs.getString("name");
		gender=rs.getString("gender");
		birthday=rs.getString("birthday");
		email=rs.getString("email");
		zipcode=rs.getString("zipcode");
		address=rs.getString("address");
		hobby=rs.getString("hobby");
		job=rs.getString("job");
		%>

<tr>
	<td><%=id %></td>
	<td><%=pwd %></td>
	<td><%=name %></td>
	<td><%=gender %></td>
	<td><%=birthday %></td>
	<td><%=email %></td>
	<td><%=zipcode %></td>
	<td><%=address %></td>
	<td><%=hobby %></td>
	<td><%=job %></td>
</tr>
<%
	counter++;
	}
}
%>
</table><br/>
total records:<%=counter %>
</body>
</html>

<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		pool.freeConnection(conn, stmt, rs);
	}
%>