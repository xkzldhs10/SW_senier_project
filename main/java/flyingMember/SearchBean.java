package flyingMember;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.xdevapi.Statement;

public class SearchBean {
	
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
	
	public MemberInfo adminSearch() {
		connect();
		
		String sql = "select * from membertable order by memberid";
		MemberInfo meminfo = new MemberInfo();
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				rs.getString("memberid");
				rs.getString("password"); 
				rs.getString("membername"); 
				rs.getString("membertype");
			    rs.getString("phonenumber"); 
			    rs.getString("email");
			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return meminfo;
		
	}
	
	// 특정 회원 정보
	public MemberInfo memberSearch(String memId) {
		connect();
		
		String sql = "select * from membertable where memberid='" + memId + "'";
		MemberInfo meminfo = new MemberInfo();
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			meminfo.setMemberId(rs.getString("memberid"));
			meminfo.setMemberPassword(rs.getString("password"));
			meminfo.setMemberName(rs.getString("membername"));
			meminfo.setMemberType(rs.getString("membertype"));
			meminfo.setPhoneNumber(rs.getString("phonenumber"));
			meminfo.setMemberEmail(rs.getString("email"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return meminfo;
	}
	
	public ReserveInfo reservationSearch(String memId) {
		connect();
		
		String sql = "select * from reservationtable where memberid='" + memId + "'";
		ReserveInfo reserveinfo = new ReserveInfo();
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			rs.next();
			reserveinfo.setMemberId(rs.getString("memberid"));
			reserveinfo.setCafeId(rs.getString("cafeid"));
			reserveinfo.setSeatNumber(rs.getString("seatnumber"));
			reserveinfo.setLockerNumber(rs.getString("lockernumber"));
			reserveinfo.setUseTime(rs.getString("time"));
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return reserveinfo;
	}

	public String indexSearch (String memId){
		String memType = null;
		connect();
		String sql ="select * from membertable where memberid = '" + memId + "'";
		try {		
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
			memType = rs.getString("membertype");
			rs.close();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();	
		}
		finally {
			disconnect();
		}
		return memType;
	}
	
	public int login(String memId, String pass) {
		int check=-1;
		connect();
		String sql ="select * from membertable where memberid = '" + memId + "'";
		
		try {		
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(pass.equals(rs.getString("password"))) {
					check=1;
				}
				else {
					check=0;
				}
			rs.close();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();	
		}
		finally {
			disconnect();
		}
		
		return check;
	}
	
	public String nameSearch (String memId){
		String memName = null;
		connect();
		String sql ="select * from membertable where memberid = '" + memId + "'";
		try {		
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
			memName = rs.getString("membername");
			rs.close();
			}
		}
		catch(SQLException e) {
			e.printStackTrace();	
		}
		finally {
			disconnect();
		}
		return memName;
	}
	
	
	// 모든 회원 목록
	public ArrayList<MemberInfo> memberList() {
		connect();
		
		ArrayList<MemberInfo> memberDB = new ArrayList<MemberInfo>();
		String sql = "select * from membertable order by memberid desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				MemberInfo meminfo = new MemberInfo();
				meminfo.setMemberId(rs.getString("memberid"));
				meminfo.setMemberPassword(rs.getString("password"));
				meminfo.setMemberName(rs.getString("membername"));
				meminfo.setMemberType(rs.getString("membertype"));
				meminfo.setPhoneNumber(rs.getString("phonenumber"));
				meminfo.setMemberEmail(rs.getString("email"));
				memberDB.add(meminfo);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return memberDB;
	}
	
	public ArrayList<ReserveInfo> reserveList(int cafeId) {
		connect();
		
		ArrayList<ReserveInfo> reserveDB = new ArrayList<ReserveInfo>();
		String sql = "select * from reservationtable where cafeid='" + cafeId + "'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				ReserveInfo reserveinfo = new ReserveInfo();
				reserveinfo.setMemberId(rs.getString("memberid"));
				reserveinfo.setCafeId(rs.getString("cafeid"));
				reserveinfo.setSeatNumber(rs.getString("seatnumber"));
				reserveinfo.setLockerNumber(rs.getString("lockernumber"));
				reserveDB.add(reserveinfo);
			}
			rs.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return reserveDB;
	}
	
	public boolean confirmId(String uid) {
		connect();
		
		String sql = "SELECT memberid FROM membertable WHERE memberid=?";
		boolean result = false;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			if(rs.next())
				result = true;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try { rs.close(); } catch(SQLException e) {}
			if(pstmt != null) try { pstmt.close(); } catch(SQLException e) {}
			if(conn != null) try { conn.close(); } catch(SQLException e) {}
		}
		return result;
	}
	
	public MemberInfo SeatSearch() {
		connect();
		
		String sql = "select * from reservetable";
		MemberInfo meminfo = new MemberInfo();
		
		try {
			pstmt = conn.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String seatNumber = rs.getString("seat_number");
				String status = rs.getString("status"); 

			}
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disconnect();
		}
		return meminfo;
		
	}
	
	public static String checkNull(String str, String replaceStr) {
		return (str == null || str.equals("")) ? replaceStr : str;
	}
	
	
}