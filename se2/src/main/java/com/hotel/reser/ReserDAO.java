package com.hotel.reser;

import java.sql.*;
import java.util.*;

public class ReserDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public ReserDAO() {
		
	}
	
	public ArrayList<RoomDTO> searchRooms(String location, int headCount){
		try {
			char locaInitial = location.charAt(0);
			
			conn = com.hotel.db.HotelDB.getConn();
			
			String sql = "SELECT FROM hotel WHERE name = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, location);
			
			rs = ps.executeQuery();
			
			// Get max count of rooms for selected location
			HashMap<String, Integer> roomMaxCount = new HashMap<String, Integer>();
			if (rs.next()) {
				roomMaxCount.put("standard", rs.getInt("standard"));
				roomMaxCount.put("deluxe", rs.getInt("deluxe"));
				roomMaxCount.put("suite", rs.getInt("suite"));
				roomMaxCount.put("grand", rs.getInt("grand"));
			}
			
			// Get current count of rooms for selected location
			sql = "SELECT type, COUNT(type) FROM reser WHERE type LIKE ? GROUP BY type";
			ps = conn.prepareStatement(sql);
			ps.setString(1, locaInitial + "_");
			
			rs = ps.executeQuery();
			
			HashMap<String, Integer> roomCurCount = new HashMap<String, Integer>();
			while (rs.next()) {
				
			}
		} catch(Exception e){
			e.printStackTrace();
			return null;
		} finally {
			try {
				
			} catch(Exception e) {}
		}
	}
}
