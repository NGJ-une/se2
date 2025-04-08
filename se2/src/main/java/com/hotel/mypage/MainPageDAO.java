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
