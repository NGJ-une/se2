package com.hotel.seoul;

import java.util.*;
import java.sql.*;


public class HotelPhotoDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public HotelPhotoDAO() {
		
	}
	
//	/** 사진 등록 메서드 */ 
//	public int photoUpload(HotelPhotoDTO pdto,int vidx) {
//	
//		try {
//			conn=com.hotel.db.HotelDB.getConn();
//			String sql="INSERT INTO PHOTO(PNUM,PNAME1,PNAME2,PNAME3) VALUES(SQ_PHOTO_NUM.NEXTVAL,?,?,?) WHERE " + vidx + "=? "; 
//			ps=conn.prepareStatement(sql);
//			
//			ps.setString(1, pdto.getPname1());
//			ps.setString(2, pdto.getPname2());
//			ps.setString(3, pdto.getPname3());
//			ps.setInt(4, vidx);
//			
//			ps.executeUpdate();
//			
//		}catch (Exception e) {
//			e.printStackTrace();
//			return -1;
//		}finally {
//			try {
//				if(ps!=null) ps.close();
//				if(conn!=null) conn.close();
//			}catch (Exception e2) {
//		
//			}
//		}
//	}

}
