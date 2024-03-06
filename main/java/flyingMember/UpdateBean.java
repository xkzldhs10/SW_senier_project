package flyingMember;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UpdateBean {
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	// MySql 연결
	String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	String jdbcUrl = "jdbc:mysql://124.49.236.21:3306/flyingdb?serverTimezone=UTC";
	
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
	
	public void myPageUpdate(String pw, String name, String phone, String email, String id) {
		connect();
		String sql ="UPDATE membertable SET password=?, membername=?, phonenumber=?, email=? where memberid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw); // 입력된 수정 정보들
			pstmt.setString(2, name);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			pstmt.setString(5, id);
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
	}
}
