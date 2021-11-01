package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class FeedDAO {

	// 게시판 글 올리기 
	public boolean insert(String uid, String ucon, String uimg) throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO feed (id, content, images) VALUES (?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, uid);
				pstmt.setString(2, ucon);
				pstmt.setString(3, uimg);
				
			int count = pstmt.executeUpdate();
			return (count ==1 ) ? true : false;
			
		} finally {
			conn.close(); pstmt.close();
		}
	}
	
	// 게시판 목록 나열하기 
	public ArrayList<FeedObj> getList() throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM feed ORDER BY ts DESC";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<FeedObj> feeds = new ArrayList<FeedObj>();
			while (rs.next()) {
				feeds.add(new FeedObj(rs.getString("id"),rs.getString("content"),rs.getString("ts"),rs.getString("images")));
			} return feeds;
			
		} finally {
			conn.close(); pstmt.close(); rs.close();
		}
	}
}
