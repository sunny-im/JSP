package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class MemberDAO {

	public int login(String cid, String cpassword) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT cid,cpassword FROM member WHERE cid =? ";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cid);
			rs = pstmt.executeQuery();
			if (!rs.next()) return 1;
			if (!cpassword.equals(rs.getString("cpassword"))) return 2;
			
			return 0;
					
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	
	public int join(String cid, String cpass, String cname, String cgender, String cbirth, String cemail, String cphone, String caddr) 
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "INSERT INTO member VALUES (?,?,?,?,?,?,?,?,?) ";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cid);
				pstmt.setString(2, cpass);
				pstmt.setString(3, cname);
				pstmt.setString(4, cgender);
				pstmt.setString(5, cbirth);
				pstmt.setString(6, cemail);
				pstmt.setString(7, cphone);
				pstmt.setString(8, caddr);
				pstmt.setString(9, LocalDate.now().toString());

			
			int count = pstmt.executeUpdate();
			return (count ==1) ? 1 : 2;   // 성공 1 , 실패 2 
					
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	
	public ArrayList<MemberObj> getList() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM member";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<MemberObj> members = new ArrayList<MemberObj>();
			
			while (rs.next()) {
				members.add(new MemberObj(rs.getString("cid"),rs.getString("cpassword"),rs.getString("cname"),rs.getString("cgender"),
						rs.getString("cbirth"),rs.getString("cemail"),rs.getString("cphone"),rs.getString("caddress"),rs.getString("cregiday")));
			} return members;
			
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
}

