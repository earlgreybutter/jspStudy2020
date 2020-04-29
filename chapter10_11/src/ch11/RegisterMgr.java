package ch11;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

public class RegisterMgr {

	private final String JDBC_DRIVER = "org.gjt.mm.mysql.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/javadb?useUnicode=true&characterEncoding=UTF-8";
	private final String USER = "javauser";
	private final String PASS = "1234";
	
	public RegisterMgr() {
		try {
			Class.forName(JDBC_DRIVER);
		}
		catch(Exception e){
			System.out.println("Error : JDBC 드라이버 로딩 실패");
		}
	}
	
	public Vector<RegisterBean> getRegisterList() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		Vector<RegisterBean> vlist = new Vector<RegisterBean>();
		
		try {
			conn = (Connection) DriverManager.getConnection(JDBC_URL,USER,PASS);
			String strQuery = "select * from tblregister";
			stmt = (Statement) conn.createStatement();
			rs = stmt.executeQuery(strQuery);
			
			while(rs.next()) {
				RegisterBean regBean = new RegisterBean();
				
				regBean.setId(rs.getString("id"));
				regBean.setPwd(rs.getString("pwd"));
				regBean.setName(rs.getString("name"));
				regBean.setNum1(rs.getString("num1"));
				regBean.setNum2(rs.getString("num2"));
				regBean.setEmail(rs.getString("email"));
				regBean.setPhone(rs.getString("phone"));
				regBean.setZipcode(rs.getString("zipcode"));
				regBean.setAddress(rs.getString("address"));
				regBean.setJob(rs.getString("job"));
				
				vlist.add(regBean);
				
			}
			
			
		}
		catch(Exception ex) {
			System.out.println("Exception : " + ex);
		}
		finally {
			if(rs!=null) {
				try {rs.close();}
				catch(SQLException e) {}
			}
			if(stmt!=null) {
				try {stmt.close();}
				catch(SQLException e) {}
			}
			if(conn!=null) {
				try {conn.close();}
				catch(SQLException e) {}
			}
		}
		
		return vlist;
	}
	
}
