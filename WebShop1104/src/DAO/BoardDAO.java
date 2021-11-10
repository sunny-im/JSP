package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class BoardDAO {

	public ArrayList<BoardObj> getList() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM board";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<BoardObj> boards = new ArrayList<BoardObj>();
			
			while (rs.next()) {
				boards.add(new BoardObj(rs.getString("bno"),rs.getString("btitle"),
						rs.getString("bcontent"),rs.getString("bauthor"),rs.getString("bimage"),rs.getString("bdate")));
			} return boards;
			
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	
	public boolean insert(String btitle, String bauthor, String bcontent,  String bimage ) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO board (btitle, bauthor, bcontent, bimage, bdate) VALUES (?,?,?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, btitle);
				pstmt.setString(2, bauthor);
				pstmt.setString(3, bcontent);
				pstmt.setString(4, bimage);
				pstmt.setString(5, LocalDate.now().toString());
				
			int count = pstmt.executeUpdate();
			return (count == 1) ? true : false;
			
		} finally {
			conn.close(); pstmt.close();
		}
	}

	public BoardObj getView(String bno) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt= null;
		ResultSet rs = null;
	
		try {
			String sql = "SELECT * FROM board WHERE (bno = ?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bno);
			rs = pstmt.executeQuery();
			
			rs.next();
			
			String no = rs.getString(1);
			String title = rs.getString(2);
			String author = rs.getString(3);
			String content = rs.getString(4);
			String image = rs.getString(5);
			String date = rs.getString(6);
			
			BoardObj board = new BoardObj(no,title,author,content,image,date);
			return board;
			
		} finally {
			rs.close(); pstmt.close(); conn.close();
		}
	} 
	
}