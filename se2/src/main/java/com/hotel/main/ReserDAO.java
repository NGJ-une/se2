package com.hotel.main;

import java.sql.*;
import java.util.*;

public class ReserDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public ReserDAO() {
		
	}
	
	public ArrayList<RoomDTO> searchRoom(String region, int capacity){
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "SELECT ";
			
			
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				
			} catch(Exception e) {}
		}
	}
}
