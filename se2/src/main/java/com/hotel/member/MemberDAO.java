package com.hotel.member;

import java.util.*;
import java.sql.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public MemberDAO() {
		
	}
	
	/** 회원가입 관련 메서드*/
	public int memberJoin(MemberDTO mdto) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="INSERT INTO MEMBER(MID,MIDX,MPWD,MFNAME,MLNAME,MBIRTH,MEMAIL,MTEL,MADDR,MJOIN_DATE,MQUESTION,MANSWER)\r\n"
					+ "VALUES(?,sq_member_idx.NEXTVAL,?,?,?,?,?,?,?,sysdate,?,?)";

			ps = conn.prepareStatement(sql);
			
			ps.setString(1, mdto.getId());
			ps.setString(2, mdto.getPwd());
			ps.setString(3, mdto.getFname());
			ps.setString(4, mdto.getLname());
			ps.setString(5, mdto.getBirth());
			ps.setString(6, mdto.getEmail());
			ps.setString(7, mdto.getTel());
			ps.setString(8, mdto.getAddr());
			ps.setInt(9, mdto.getQuestion());
			ps.setString(10, mdto.getAnswer());
			int count = ps.executeUpdate(); 
			return count; 
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			}catch (Exception e2) {
				
			}
		}
	}
	

	/** 아이디 중복검사 관련 메서드 */
	// member테이블에서 ID컬럼만 파라미터 받아서 중복검사
	public boolean idCheck(String userid) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "SELECT * FROM MEMBER WHERE MID=?"; 
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery(); 
			return rs.next(); 
		} catch (Exception e) {
			e.printStackTrace();
			return false; 
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
			}
		}
	}
	
	
	/**  로그인 메소드1   */  //ID 입력 시 비밀번호 찾는 메소드
	
	public String loginCheckPwd(String userid) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT MPWD FROM MEMBER WHERE MID=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			String userpwd=null;
			if(rs.next()) {
				userpwd= rs.getString("MPWD");
			} 
			return userpwd;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;

		}finally {
			try {
				if (rs != null) rs.close(); 
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			}catch (Exception e2) {
				}
			}
		}
	
////	
/**  로그인 메소드2   */  //pwd 입력시 아이디 찾는 메소드
	
	public String loginCheckId(String userpwd) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT MID FROM MEMBER WHERE MPWD=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userpwd);
			rs=ps.executeQuery();
			String userid=null;
			if(rs.next()) {
				userid= rs.getString("MID");
			} 
			return userid;
		}
		catch (Exception e) {
			e.printStackTrace();
			return null;

		}finally {
			try {
				if (rs != null) rs.close(); 
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			}catch (Exception e2) {
				}
			}
		}
	
	

	/** 아이디 찾기 */ 
	public String idFind(String usertel, int userquestion, String useranswer) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT MID FROM MEMBER WHERE MTEL=? AND MQUESTION=? AND MANSWER=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, usertel);
			ps.setInt(2, userquestion);
			ps.setString(3, useranswer);
			rs=ps.executeQuery();
			
			String userid=null;
			
			if(rs.next()) { //컬럼의 데이터있니?
				userid= rs.getString("MID");
			}
			return userid;
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				if (rs != null) rs.close(); 
				if (ps != null) ps.close();
				if (conn != null) conn.close();
				
			}catch (Exception e2) {
				 		
			}
		}
	}
	
	
	
	/** 비밀번호 찾는 메소드 */ 
	
	public String pwdFind(String userid,String usertel) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT MPWD FROM MEMBER WHERE MID=? AND MTEL=? ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			ps.setString(2, usertel);
			rs=ps.executeQuery();
			
			String userpwd=null;
			
			if(rs.next()) { //컬럼의 데이터있니?
				userpwd= rs.getString("MPWD");
			}
			return userpwd;
			
		}catch (Exception e) {
			e.printStackTrace();
			return null;
			
		}finally {
			try {
				if (rs != null) rs.close(); 
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			}catch (Exception e2) {
				
			}
		}
	}
	
}

	
	
	
	
	///////////////////////////////////////////////////////////////////////////////////////////////////

	
	/**로그인 후 이름 찾는 메서드*/ //로그인 시 상단에 이름 보이도록

	
              

	
	
	
	/** 비밀번호 찾는 메소드 */    //id 검색 시 비밀번호 알려줌
	

	
	


















