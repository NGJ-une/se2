package com.hotel.mypage;

import java.util.*;
import java.sql.*;

public class DepositDAO {


	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public DepositDAO() {
		// TODO Auto-generated constructor stub
	}
	//충전하기 메서드
	public int chargeAmount(int money, String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "update member set mmoney = mmoney+? where mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, money);
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
	//충전 내역 가져오기 메서드
	public int importAmount(String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select mmoney from member where mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			int money = 0;
			while(rs.next()) {
				money = rs.getInt("mmoney");
			}
			return money;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
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
	//등급 수정 메서드
	public int grade(String grade,String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "update member set mgrade = ? where mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, grade);
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
	//회원 정보 가져오기 메서드
	public ArrayList<DepositDTO> mypageMemberInfo(String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select mfname, mlname, midx, mpoint from member where mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			ArrayList<DepositDTO> arr = new ArrayList<DepositDTO>();
			while(rs.next()) {
				String mfname = rs.getString("mfname");
				String mlname = rs.getString("mlname");
				int midx = rs.getInt("midx");
				int mpoint = rs.getInt("mpoint");
				
				DepositDTO dto = new DepositDTO(midx, mfname, mlname, mpoint);
				arr.add(dto);
			}
			return arr;
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
}
