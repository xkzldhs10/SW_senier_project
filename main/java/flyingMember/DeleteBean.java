package flyingMember;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DeleteBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// MySql 연결
	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://124.49.236.21:3306/flyingdb?serverTimezone=UTC";
	//124.49.236.21
	// DB 연결
	void connect() {
		try {
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(jdbcUrl, "root", "flying");
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("jdbc 연결 실패!");
		}
	}
	
	// 연결 해제
	void disconnect() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		if(conn != null) {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	public void myPageDelete(String memId) {
		connect();
		String sql ="delete from membertable where memberid= '" + memId + "'";
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();	
		}
		finally {
			disconnect();
		}
	}
	
	public void myPageReserveDelete(String memId) {
		connect();
		String sql ="delete from reservationtable where memberid= '" + memId + "'";
		try {		
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
		}
		catch(SQLException e) {
			e.printStackTrace();	
		}
		finally {
			disconnect();
		}
	}
}
