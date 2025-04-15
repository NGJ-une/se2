package com.hotel.reser;

import java.sql.*;
import java.util.*;

public class ReserDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public ReserDAO() {
		
	}
	
	public ArrayList<RoomDTO> searchRooms(String region, int headCount, java.sql.Date checkIn){
		try {
			char regionInitial = region.charAt(2);
			
			conn = com.hotel.db.HotelDB.getConn();
			
			String sql = "SELECT * FROM hotel WHERE hname = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, region);
			rs = ps.executeQuery();
			
			HashMap<String, Integer> roomMaxCount = new HashMap<String, Integer>();
			if (rs.next()) {
				roomMaxCount.put("standard", rs.getInt("standard")); 
				roomMaxCount.put("deluxe", rs.getInt("deluxe")); 
				roomMaxCount.put("suite", rs.getInt("suite")); 
				roomMaxCount.put("grand", rs.getInt("grand")); 
			}
			
			sql = "SELECT SUBSTR(rtype, 3) AS room_type, COUNT(rtype) AS reserved_count FROM reser WHERE rtype LIKE ? AND rcheckout < ? GROUP BY rtype";
			ps = conn.prepareStatement(sql);
			ps.setString(1, regionInitial + "_%");
			ps.setDate(2, checkIn);
			rs = ps.executeQuery();
			
			HashMap<String, Integer> reservedCount = new HashMap<String, Integer>();
			while (rs.next()) {
				reservedCount.put(rs.getString("room_type"), rs.getInt("reserved_count"));
			}
			
			sql = "SELECT * FROM room WHERE type LIKE ? AND capacity >= ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, regionInitial + "_%");
			ps.setInt(2, headCount);
			rs = ps.executeQuery();
			
			ArrayList<RoomDTO> res = new ArrayList<RoomDTO>();
			while (rs.next()) {
				String roomType = rs.getString("type").substring(2);
				int maxCount = roomMaxCount.get(roomType);
				int curCount = reservedCount.getOrDefault(roomType, 0);
				
				if (curCount < maxCount) {
					RoomDTO dto = new RoomDTO(rs.getString("type"), rs.getInt("idx"), rs.getString("img_name"), rs.getInt("price"),
							rs.getInt("capacity"));
					res.add(dto);
				}
			}
			return res;
		} catch(Exception e){
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null) rs.close();
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
	}
	
	public int reserveRoom(ReserDTO dto, int orgPrice) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			
			String sql = "INSERT INTO reser VALUES (sq_reser_idx.NEXTVAL, ?, ?, ? ,?, ?, ?, ?, ?, ?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getType());
			ps.setDate(4, dto.getCheckIn());
			ps.setDate(5, dto.getCheckOut());
			ps.setInt(6, dto.getAdult());
			ps.setInt(7, dto.getKid());
			ps.setInt(8, dto.getBaby());
			ps.setInt(9, dto.getMoney());
			
			int count = ps.executeUpdate();
			
			if (count < 1) {
				return count;
			}
			
			sql = "UPDATE member SET mpoint = mpoint + ?, mmoney = mmoney - ? WHERE mid = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, orgPrice);
			ps.setInt(2, dto.getMoney());
			ps.setString(3, dto.getId());
			
			return ps.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch(Exception e) {}
		}
	}
}
