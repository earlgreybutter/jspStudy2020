package ch14;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

public class MemberMgr {

	private DBConnectionMgr pool;

	public MemberMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	// 아이디 중복확인
	public boolean checkId(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = null;
		boolean flag = false;

		try {
			con = pool.getConnection();
			sql = "select id from tblmember where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			flag = pstmt.executeQuery().next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}

	// 우편번호 검색
	public Vector<ZipcodeBean> zipcodeRead(String area3) {

		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = null;

		Vector<ZipcodeBean> vlist = new Vector<ZipcodeBean>();

		try {
			con = pool.getConnection();
			sql = "select * from tblzipcode where area3 like ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + area3 + "%");
			//System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();

			while (rs.next()) {
				ZipcodeBean bean = new ZipcodeBean();

				bean.setZipcode(rs.getString(1));
				bean.setArea1(rs.getString(2));
				bean.setArea2(rs.getString(3));
				bean.setArea3(rs.getString(4));

				vlist.addElement(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}

	// 회원가입
	public boolean insertMember(MemberBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		Boolean flag = false;

		try {
			con = pool.getConnection();
			sql = "insert tblMember(id,pwd,name,gender,birthday,email,zipcode,address,hobby,job)"
					+ "values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getGender());
			pstmt.setString(5, bean.getBirthday());
			pstmt.setString(6, bean.getEmail());
			pstmt.setString(7, bean.getZipcode());
			pstmt.setString(8, bean.getAddress());

			String hobby[] = bean.getHobby();
			char hb[] = { '0', '0', '0', '0', '0' };
			String lists[] = { "인터넷", "여행", "게임", "영화", "운동" };
			for (int i = 0; i < hobby.length; i++) {
				for (int j = 0; j < lists.length; j++) {
					if (hobby[i].equals(lists[j])) {
						hb[i] = '1';
					}
				}

			}
			pstmt.setString(9, new String(hb));
			pstmt.setString(10, bean.getJob());

			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}

		return flag;
	}

	// 로그인
	public boolean loginMember(String id, String pwd) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;

		try {
			con = pool.getConnection();
			sql = "select id from tblMember where id = ? and pwd = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return flag;
	}

	// 회원정보보기
	public MemberBean memView(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		MemberBean membn = null;

		try {
			con = pool.getConnection();
			sql = "select * from tblMember where id = ? ";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			//System.out.println(pstmt.toString());
			rs = pstmt.executeQuery();
			System.out.print(rs.toString());
			
			while(rs.next()) {
				membn = new MemberBean();

				membn.setId(rs.getString(1));
				membn.setPwd(rs.getString(2));
				membn.setName(rs.getString(3));
				membn.setGender(rs.getString(4));
				membn.setBirthday(rs.getString(5));
				membn.setEmail(rs.getString(6));
				membn.setZipcode(rs.getString(7));
				membn.setAddress(rs.getString(8));
				//membn.setHobby(rs.getString(9));
				membn.setJob(rs.getString(10));

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return membn;
	}
}
