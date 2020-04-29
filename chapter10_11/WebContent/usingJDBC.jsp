<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>
    <%@page import ="java.util.*, ch11.*" %>
    <%
    Class.forName("org.gjt.mm.mysql.Driver");
    
    DBConnectionMgr dbcp = null;
    Connection conn = null;
    Statement stmt = null; 
    ResultSet rs = null;
    
    String id = "", pwd = "", name = "", num1="", num2="", email="", phone="", zipcode="",
    		address="", job="";
    int counter=0;
    
    try{
    	// 풀객체
    	dbcp = DBConnectionMgr.getInstance();
    	// 연동객체
    	conn = dbcp.getConnection();
    	//conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/javadb", "javauser","1234");
    	stmt = conn.createStatement();
    	rs = stmt.executeQuery("SELECT * FROM tblRegister");
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP에서 데이터베이스 연동</title>
</head>
<body bgcolor="#FFFFCC">
	<h2>JSP스크립트에서 데이터베이스 연동 예제</h2><br/>
	<h3>회원정보</h3>
	<table bordercolor="#0000ff" border="1">
		<tr>
			<td><strong>ID</strong></td>
			<td><strong>PWD</strong></td>
			<td><strong>NAME</strong></td>
			<td><strong>NUM1</strong></td>
			<td><strong>NUM2</strong></td>
			<td><strong>EMAIL</strong></td>
			<td><strong>PHONE</strong></td>
			<td><strong>ZIPCODE/ADDRESS</strong></td>
			<td><strong>JOB</strong></td>
		</tr>
		<%
		if(rs!=null){
			while(rs.next()){
				id = rs.getString("id");
				pwd = rs.getString("pwd");
				name = rs.getString("name");
				num1 = rs.getString("num1");
				num2 = rs.getString("num2");
				email = rs.getString("email");
				phone = rs.getString("phone");
				zipcode = rs.getString("zipcode");
				address = rs.getString("address");
				job = rs.getString("job");
		
		%>
		<tr>
			<td><%=id%></td>
			<td><%=pwd%></td>
			<td><%=name%></td>
			<td><%=num1%></td>
			<td><%=num2%></td>
			<td><%=email%></td>
			<td><%=phone%></td>
			<td><%=zipcode%>/<%=address%></td>
			<td><%=job%></td>
		</tr>
			<%
					counter++;
					}
				}
			%>

	</table>
	<br/>
	total records:<%=counter%>
	<%
    } catch(SQLException sqlException){
    	System.out.println("error:SQL"+sqlException);
    } catch(Exception exception){
    	System.out.println("error:Ex");
    } finally {
    	/*if (rs!=null){
    		try {rs.close();}
    		catch (SQLException ex){System.out.println("error:rs");}
    	}
    	if (stmt!=null){
    		try {stmt.close();}
    		catch (SQLException ex){System.out.println("error:stmt");}
    	}
    	if (conn!=null){
    		try {conn.close();}
    		catch (Exception ex){System.out.println("error:conn");}
    	}*/
    	if(dbcp!=null){
    		try{
    			dbcp.freeConnection(conn, stmt, rs);
    		}
    		catch(Exception ex){}
    	}
    }
	%>
</body>
</html>