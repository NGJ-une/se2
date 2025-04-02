package com.hotel.member;

import java.util.*;
import java.sql.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2;
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1;
	
	public MemberDAO() {
		
	}
	
	/** 회원가입 관련 메서드*/
	public int memberJoin(MemberDTO mdto) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="INSERT INTO MEMBER(ID,IDX,PWD,FNAME,LNAME,BIRTH,EMAIL,TEL,ADDR,JOIN_DATE,QUESTION,ANSWER)\r\n"
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
	public boolean idCheck(String userid) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = " select * from member where id=?"; 
			
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
	
	/** 로그인 관련 메서드*/

	public int loginCheck(String userid,String userpwd) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT PWD FROM MEMBER WHERE ID=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			if(rs.next()) {
				String dbpwd =rs.getString("pwd");
				
				if(dbpwd.equals(userpwd)){
					return LOGIN_OK;
				}
				
				else {
					return NOT_PWD;
					}
				
			}else{
				return NOT_ID;
			}
				
		}catch (Exception e) {
			e.printStackTrace();
			return ERROR;

		}finally {
			try {
				if (rs != null)rs.close();
				if (ps != null)ps.close();
				if (conn != null)conn.close();
			}catch (Exception e2) {}
		}
	}
	
	/**로그인 후 이름 찾는 메서드*/
	public String getName(String userid) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT FNAME, LNAME FROM MEMBER WHERE ID=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
		}catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				
			}catch (Exception e2) {
				
			}
		}
		
	}
	
}                        


















