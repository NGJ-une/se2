package com.hotel.seoul;

import java.util.*;



import com.hotel.seoul.HotelReviewDTO;


import java.sql.*;
import java.sql.Date;

public class HotelReviewDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	

	public HotelReviewDAO() {
		// TODO Auto-generated constructor stub
	}
	//후기 리스트 가져오기 메서드
	public ArrayList<HotelReviewDTO> getInfoReviewList(int cp, int ls) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			int start = (cp-1)*ls+1;
			int end = cp*ls;
			String sql = "select * from (select row_number() over (order by vdate desc) as rnum, vidx,"
					+ "vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal "
					+ "from review) where rnum between ? and ?";
			String sql2 = "select * from (select rownum as rnum, vidx, "
					+ "vid, vtitle, vcontent, vdate,vreadnum, vrecommend, vcomment, vtotal from review)"
					+ " where rnum>= ? and rnum <= ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<HotelReviewDTO> arr = new ArrayList<HotelReviewDTO>();
			while(rs.next()) {
				int rnum = rs.getInt("rnum");
				int vidx = rs.getInt("vidx");
				String vid = rs.getString("vid");
				String vtitle = rs.getString("vtitle");
				String vcontent = rs.getString("vcontent");
				Date vdate = rs.getDate("vdate");
				int vreadnum = rs.getInt("vreadnum");
				int vrecommend = rs.getInt("vrecommend");
				int vcomment = rs.getInt("vcomment");
				int vtotal = rs.getInt("vtotal");
				HotelReviewDTO dto = new HotelReviewDTO(vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal, rnum);
				arr.add(dto);
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	//후기 총 갯수 가져오기 메서드
	public int getTotalCount() {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select count(*) from review";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int count = 0;
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
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
	//게시물 보기 메서드
	public ArrayList<HotelReviewDTO> getReviewRead(int idx) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select * from review where vidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs = ps.executeQuery();
			ArrayList<HotelReviewDTO> arr = new ArrayList<HotelReviewDTO>();
			while(rs.next()) {
	            int vidx = rs.getInt("VIDX");
	            String vid = rs.getString("VID");
	            String vtitle = rs.getString("VTITLE");
	            String vcontent = rs.getString("VCONTENT");
	            Date vdate = rs.getDate("VDATE");
	            int vreadnum = rs.getInt("VREADNUM");
	            int vrecommend = rs.getInt("VRECOMMEND");
	            int vcomment = rs.getInt("VCOMMENT");
	            int vtotal = rs.getInt("VTOTAL");
				HotelReviewDTO dto = new HotelReviewDTO(vidx, vid, vtitle, vcontent, vdate, vreadnum, vrecommend, vcomment, vtotal);
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
	
	
