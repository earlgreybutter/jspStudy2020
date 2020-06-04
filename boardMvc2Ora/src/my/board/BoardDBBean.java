package my.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


public class BoardDBBean {

	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	private BoardDBBean() {
		
	}
	
	public Connection getConnection() throws Exception {	// test를 위해 임시적으로 public으로 바꾸어줌 
		Context initCtx = new InitialContext();
		Context envCtx = (Context)initCtx.lookup("java:comp/env");
		DataSource ds = (DataSource)envCtx.lookup("jdbc/oracle");
		return ds.getConnection();
	}
	
	public void insertArticle(BoardDataBean article) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		String sql ="";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select max(num) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1)+1;
			}
			else {
				number = 1;
			}
			
			if(num!=0) {
				System.out.println("답글~~~~~~~~~~~~~~~~~~~");
				sql="update board set re_step=re_step+1 where ref=? and re_step>?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				
				pstmt.executeUpdate();
				re_step = re_step+1;
				re_level = re_level+1;
			}
			else {
				System.out.println("새글~~~~~~~~~~~~~~~~~~~");
				ref = number;
				re_step=0;
				re_level=0;
			}
			
			sql = "insert into board (num, writer, email, subject, passwd, reg_date, ref, re_step, re_level, content, ip) "
					+ " values (board_num_seq.nextval, ?,?,?,?,?,?,?,?,?,?)";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getEmail());
			pstmt.setString(3, article.getSubject());
			pstmt.setString(4, article.getPasswd());
			pstmt.setTimestamp(5, article.getReg_date());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, article.getContent());
			pstmt.setString(10, article.getIp());
			System.out.println(pstmt.toString());
			pstmt.executeUpdate();
			
		}
		catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}
		finally {
			if(rs!=null) {
				try {
					rs.close();
				}
				catch (SQLException e) {
					// TODO: handle exception
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				}
				catch (SQLException e) {
					// TODO: handle exception
				}
			}
			if(conn!=null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					// TODO: handle exception
				}
			}
		}
	}
	
}
