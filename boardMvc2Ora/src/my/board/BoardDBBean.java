package my.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
				System.out.println("답글~~~~~~~~~~~~~~~~~~~");	// test용
				sql="update board set re_step=re_step+1 where ref=? and re_step>?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, re_step);
				
				pstmt.executeUpdate();
				re_step = re_step+1;
				re_level = re_level+1;
			}
			else {
				System.out.println("새글~~~~~~~~~~~~~~~~~~~");	// test용
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
	
	public int getArticleCount() throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x = 0;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from board");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				x = rs.getInt(1);
			}
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
		return x; 
	}
	
	public List getArticles(int start, int end) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List articleList = null;
		
		try {
			conn = getConnection();
			
			pstmt = conn.prepareStatement("select a.* " + 
					"from (select ROWNUM as RNUM, b.* " + 
					"	from ( select * from board order by ref desc, re_step asc ) b) a " + 
					"where a.RNUM >=?  and a.RNUM <=? "
			);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				articleList = new ArrayList(end);
				do {
					BoardDataBean article = new BoardDataBean();
					article.setNum(rs.getInt("num"));
					article.setWriter(rs.getString("writer"));
					article.setEmail(rs.getString("email"));
					article.setSubject(rs.getString("subject"));
					article.setPasswd(rs.getString("passwd"));
					article.setReg_date(rs.getTimestamp("reg_date"));
					article.setReadcount(rs.getInt("readcount"));
					article.setRef(rs.getInt("ref"));
					article.setRe_step(rs.getInt("re_step"));
					article.setRe_level(rs.getInt("re_level"));
					article.setContent(rs.getString("content"));
					article.setIp(rs.getString("ip"));
					
					articleList.add(article);
				}while(rs.next());
			}
		}
		catch (Exception ex) {
			// TODO: handle exception
			System.out.println("error");
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
		return articleList;
	}
	
	public BoardDataBean getArticle(int num) throws Exception {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("update board set readcount=readcount+1 where num = ?");
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			pstmt = conn.prepareStatement("select * from board where num = ?");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
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
				catch(SQLException ex) {
					
				}
			}
			
			if(pstmt!=null) {
				try {
					pstmt.close();
				}
				catch(SQLException ex) {
					
				}
			}
			
			if(conn!=null) {
				try {
					conn.close();
				}
				catch(SQLException ex) {
					
				}
			}
		}
		return article;
	}
	
	public BoardDataBean updateArticle(int num) throws Exception {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BoardDataBean article = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select * from board where num = ? ");
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new BoardDataBean();
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setEmail(rs.getString("email"));
				article.setSubject(rs.getString("subject"));
				article.setPasswd(rs.getString("passwd"));
				article.setReg_date(rs.getTimestamp("reg_date"));
				article.setReadcount(rs.getInt("readcount"));
				article.setRef(rs.getInt("ref"));
				article.setRe_step(rs.getInt("re_step"));
				article.setRe_level(rs.getInt("re_level"));
				article.setContent(rs.getString("content"));
				article.setIp(rs.getString("ip"));
			}
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
				catch(SQLException e) {
					
				}
			}
			if(pstmt!=null) {
				try {
					pstmt.close();
				}
				catch(SQLException e) {
					
				}
			}
			if(conn!=null) {
				try {
					conn.close();
				}
				catch(SQLException e) {
					
				}
			}

		}
		return article;
	}
	
}
