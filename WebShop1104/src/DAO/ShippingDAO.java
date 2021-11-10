package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ShippingDAO {

	public int insert(String cid, String pname, String pprice, String ppricetotal, String paccount, String paddress) 
			throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "INSERT INTO shipping VALUES (?,?,?,?,?,?,?,?) ";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cid);
				pstmt.setString(2, pname);
				pstmt.setString(3, pprice);
				pstmt.setString(4, ppricetotal);
				pstmt.setString(5, paccount);
				pstmt.setString(6, paddress);
				pstmt.setString(7, LocalDate.now().toString());
				pstmt.setString(8, "1");

			
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
	
	public ArrayList<ShippingObj> getList() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM shipping";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<ShippingObj> goods = new ArrayList<ShippingObj>();
			
			while (rs.next()) {
				goods.add(new ShippingObj(rs.getString("cid"),rs.getString("pname"),rs.getString("pprice"),rs.getString("ppricetotal"),
						rs.getString("paccount"),rs.getString("paddress"),rs.getString("pdate"),rs.getString("pstatus")));
			} return goods;
			
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
