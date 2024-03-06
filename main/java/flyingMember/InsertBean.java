package flyingMember;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class InsertBean {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	// MySql 연결
	private final String jdbcDriver = "com.mysql.cj.jdbc.Driver";
	private final String jdbcUrl =  "jdbc:mysql://124.49.236.21:3306/flyingdb?serverTimezone=UTC";
	private final String user = "root";
	private final String pwd = "flying";
	
	// DB 연결
	void connect() {
		try {
			Class.forName(jdbcDriver);
			conn = DriverManager.getConnection(jdbcUrl, user, pwd);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// 신규 주소록 메시지 추가 메서드
	public boolean memberInsert(MemberInfo memberinfo) {
		connect();
		
		String sql = "insert into membertable values (?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberinfo.getMemberId());
			pstmt.setString(2, memberinfo.getMemberPassword());
			pstmt.setString(3, memberinfo.getMemberName());
			pstmt.setString(4, memberinfo.getMemberType());
			pstmt.setString(5, memberinfo.getPhoneNumber());
			pstmt.setString(6, memberinfo.getMemberEmail());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return true;
	}
	
	public boolean reserveInsert(String a, String b, String c, String d, String f, String g) {
		connect();
		
		String sql = "insert into reservationtable values (?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, a);
			pstmt.setString(2, b);
			pstmt.setString(3, c);
			pstmt.setString(4, d);
			pstmt.setString(5, f);
			pstmt.setString(6, g);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return true;
	}
}