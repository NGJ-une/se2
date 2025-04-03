package com.hotel.mypage;

import java.sql.*;
import java.util.*;

public class PwchangeDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public PwchangeDAO() {
		// TODO Auto-generated constructor stub
	}
	//현재 비밀번호 가져오기 메서드
	public String nowPwdBring(String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select pwd from member where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			String pwd = "";
			if(rs.next()) {
				pwd = rs.getString("pwd");
			}
			return pwd;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	//비밀번호 변경 메서드
	public int pwChange(String id, String pwd) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "update member set pwd = ? where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, id);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
}
