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
	
	public int chargeAmount(int money, String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "update member set money = money+? where id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, money);
			ps.setString(2, id);
			System.out.println(money);
			int count = ps.executeUpdate();
			System.out.println(count);
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
