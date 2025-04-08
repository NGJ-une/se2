package com.hotel.mypage;

import java.sql.*;
import java.util.*;

public class RefundDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public RefundDAO() {
		// TODO Auto-generated constructor stub
	}
	//환불하기 메서드
	public int reFund(String id, int money) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "update member set mmoney = mmoney-? where mid = ? and mmoney >= ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, money);
			ps.setString(2, id);
			ps.setInt(3, money);
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
	//환불내역 추가 메서드
	public int refundDetails(RefundDTO dto) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "insert into refund values (sq_refund_idx.nextval,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getMid());
			ps.setString(2, dto.getBbank());
			ps.setString(3, dto.getBacount());
			ps.setInt(4, dto.getMmoney());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
