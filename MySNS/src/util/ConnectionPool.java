package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ConnectionPool {

	private static DataSource ds = null;
	
	public static Connection get() throws NamingException, SQLException {
		if (ds == null) {
			ds = (DataSource) (new InitialContext()).lookup("java:comp/env/jdbc/sns");
		}
		return ds.getConnection();
	}
}
