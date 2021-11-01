package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;


public class UserDAO {

	// 회원가입 
	public boolean insert(String uid, String upass, String uname) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO user(id, password, name) VALUES(?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, upass);
				pstmt.setString(3, uname);
			
			// 입력하기만(넣기만) 하는 것이므로 리턴은 필요없고 성공 실패만 확인한다.
			int count = pstmt.executeUpdate();
			return (count == 1) ? true : false;
			
		} finally {
			conn.close(); pstmt.close();
		}
	}
	
	// 아이디값 존재 여부 확인 (중복확인)
	public boolean exists(String uid) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
			
				rs = pstmt.executeQuery();
			return rs.next();
			
		} finally {
			conn.close(); pstmt.close(); rs.close();
		}
	}
	
	// 회원 삭제 
	public boolean delete(String uid) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "DELETE FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				
			int count = pstmt.executeUpdate();
			return (count ==1 )? true : false;
		
		} finally {
			conn.close(); pstmt.close();
		}
	}
	
	// 로그인 
	public int login (String uid, String upass) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT id, password FROM user WHERE id = ?";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if (!rs.next())	return 1; // 아이디가 존재하지 않는다.
			// if-else문을 사용하지 않는 이유는, else를 사용할 경우 if문이 true이면 바로 종료되므로
			// if문을 각각 진행해 주었다.
			if (!upass.contentEquals(rs.getString("password"))) return 2; // 비밀번호가 일치하지 않는 경우 
			
			return 0;
			
		} finally {
			conn.close(); pstmt.close(); rs.close();
		}
	}
	
	// 전체 명단 가져오기 
	public ArrayList<UserObj> getList() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM user ORDER by ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// rs를 받아와서 ArrayList로 객체화 시킨다.
			ArrayList<UserObj> users = new ArrayList<UserObj>();
			// rs.next()가 true일 때(다음줄에 값이 있을 때) UserObj에서 id,name,ts값을 가져온다.
			while (rs.next()) {
				users.add(new UserObj(rs.getString("id"),rs.getString("name"),rs.getString("ts")));
			}
			return users;
			
		} finally {
			conn.close(); pstmt.close(); rs.close(); 
		}
	}
}
