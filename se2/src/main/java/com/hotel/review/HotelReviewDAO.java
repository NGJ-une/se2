package com.hotel.review;

import java.sql.*;
import java.util.*;

public class HotelReviewDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public HotelReviewDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int reviewWrite(HotelReviewDTO dto) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "insert into review (vidx,vid,vtitle,vcontent,vdate,vtotal) values(sq_review_idx.nextval,?,?,?,sysdate,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getVid());
			ps.setString(2, dto.getVtitle());
			ps.setString(3, dto.getVcontent());
			ps.setInt(4, dto.getVtotal());
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
	/*public ArrayList<HotelReviewDTO> replyList(int vidx) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select *";
		} catch (Exception e) {
			// TODO: handle exception
		}finally {
			try {
				
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}*/
}
