package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.NamingException;

import util.ConnectionPool;

public class ProductDAO {

	public ArrayList<ProductObj> getList() throws NamingException, SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			String sql = "SELECT * FROM product";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			ArrayList<ProductObj> products = new ArrayList<ProductObj>();
			
			while (rs.next()) {
				products.add(new ProductObj(rs.getString("pid"),rs.getString("pname"),
						rs.getString("pdescription"),rs.getString("pprice"),rs.getString("pfilename")));
			} return products;
			
		} finally {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		}
	}
	
	public boolean insert(String pid, String pname, String pdes, String pprice, String pphoto ) throws NamingException, SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			String sql = "INSERT INTO product (pid, pname, pdescription, pprice, pfilename) VALUES (?,?,?,?,?)";
			
			conn = ConnectionPool.get();
			pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pid);
				pstmt.setString(2, pname);
				pstmt.setString(3, pdes);
				pstmt.setString(4, pprice);
				pstmt.setString(5, pphoto);
				
			int count = pstmt.executeUpdate();
			return (count ==1 ) ? true : false;
			
		} finally {
			conn.close(); pstmt.close();
		}
	}

}
