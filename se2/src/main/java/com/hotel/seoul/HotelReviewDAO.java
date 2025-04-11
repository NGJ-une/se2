package com.hotel.seoul;

import java.util.*;


import java.sql.*;

public class HotelReviewDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public HotelReviewDAO() {

	}
	
	/** 글쓰기 메서드 글쓰기 하면 데이터 입력 */
	
	public int reviewWrite(HotelReviewDTO vdto) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "INSERT INTO REVIEW (VIDX,VID,VTITLE, VCONTENT, VDATE, VTOTAL) VALUES(SQ_REVIEW_IDX.NEXTVAL,?,?,?,SYSDATE,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vdto.getVid());
			ps.setString(2, vdto.getVtitle());
			ps.setString(3, vdto.getVcontent());
			ps.setInt(4, vdto.getVtotal());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {}
		}
	}
}
	
	
