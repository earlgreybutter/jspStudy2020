package ch12;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterMgr {

	private DBConnectionMgr pool;
	
	public RegisterMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		}
		catch(Exception e) {
			System.out.println("Error : Ŀ�ؼ� ���� ����");
		}
	}
	
	public boolean loginRegister(String id, String pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		boolean loginCon = false;
		
		try {
			conn = pool.getConnection();
			String query = "select count(*) from tblRegister where id=? and pwd=?";
			
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()&&rs.getInt(1)>0) {
				loginCon=true;
			}
		}
		catch(Exception e) {
			System.out.println("Exception : "+e);
		}
		finally {
			pool.freeConnection(conn, pstmt, rs);
		}
		return loginCon;
	}
}
