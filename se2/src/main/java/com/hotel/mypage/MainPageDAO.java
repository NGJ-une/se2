package com.hotel.mypage;

import java.sql.*;
import java.sql.Date;
import java.util.*;

public class MainPageDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public MainPageDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public ArrayList<MainPageDTO> getReserInfo(String id) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "SELECT * FROM reser WHERE rcheckin >= ADD_MONTHS(SYSDATE, -6) and rid = ? order by ridx asc";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			ArrayList<MainPageDTO> arr = new ArrayList<MainPageDTO>();
			while(rs.next()) {
				int ridx = rs.getInt("ridx");
				String rid = rs.getString("rid");
				String rname = rs.getString("rname");
				String rtype = rs.getString("rtype");
				Date rcheckin = rs.getDate("rcheckin");
				Date rcheckout = rs.getDate("rcheckout");
				int radult = rs.getInt("radult");
				int rkid = rs.getInt("rkid");
				int rbaby = rs.getInt("rbaby");
				int rmoney = rs.getInt("rmoney");
				MainPageDTO dto = new MainPageDTO(ridx, rid, rname, rtype, rcheckin, rcheckout, radult, rkid, rbaby, rmoney);
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
	
	
	
//	/** 체크아웃 후 7일 이내 후기작성 메서드 */
//	
//	public boolean reviewCanWrite (int ridx) {
//		
//	    boolean result = false;
//	    try {
//	    	conn = com.hotel.db.HotelDB.getConn();
//	        String sql = "SELECT RCEHCKOUT FROM RESER WHERE RIDX = ?";
//	        ps = conn.prepareStatement(sql);
//	        ps.setInt(1, ridx);
//	        rs = ps.executeQuery();
//
//	        if (rs.next()) {
//	            Date rcheckout = rs.getDate("rcheckout");
//	        
//	            long checkoutTime = rcheckout.getTime(); //체크아웃 날짜 시간
//	            long now = System.currentTimeMillis(); //현재 시간 가져옴
//
//	            // 7일 = 7 * 24 * 60 * 60 * 1000 (밀리초 기준임)
//	            long writeCan = now - checkoutTime;
//
//	            if (writeCan >= 0 && writeCan <= 7L * 24 * 60 * 60 * 1000) {
//	                result = true;
//	            }
//	        }
//	    }catch (Exception e) {
//	    	e.printStackTrace();
//	    	
//		}finally {
//			try {
//				if (rs != null) rs.close();
//	            if (ps != null) ps.close();
//	            if (conn != null) conn.close();
//			}catch (Exception e2) {
//	        }
//	    }
//	    	return result;
//	}
//}

	
	
	

