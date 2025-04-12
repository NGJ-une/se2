package com.hotel.seoul;

import java.util.*;
import java.sql.*;
import com.hotel.seoul.SeoulWriteDAO;

public class HotelPhotoDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public HotelPhotoDAO() {
		
	}
	
	/** 사진 등록 메서드 */ 
//	public int photoUpload(HotelPhotoDTO pdto) {
//	
//		try {
//			conn=com.hotel.db.HotelDB.getConn();
//			
//			SeoulWriteDAO vdao;
//			int vidx=vdao.recentPost();
//			
//		//	String sql="INSERT INTO PHOTO(PNUM,PNAME1,PNAME2,PNAME3) VALUES(SQ_PHOTO_NUM.NEXTVAL,?,?,?) WHERE = ? "; 
//			String sql="INSERT INTO PHOTO VALUES(?,SQ_PHOTO_NUM.NEXTVAL,?,?,?)";
//			ps=conn.prepareStatement(sql);
//			ps.setInt(1, pdto.getPidx());
//			ps.setString(2, pdto.getPname1());
//			ps.setString(3, pdto.getPname2());
//			ps.setString(4, pdto.getPname3());
//			
//			int count = ps.executeUpdate();
//			return count;
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
	
	/** 사진 등록 메서드 */ 
	public int photoUpload(HotelPhotoDTO pdto) {
	    try {
	        conn = com.hotel.db.HotelDB.getConn();

	     
	        SeoulWriteDAO vdao = new SeoulWriteDAO();
	        int vidx = vdao.recentPost(); // 최근 글 idx 받아옴

	        String sql = "INSERT INTO PHOTO VALUES(?, SQ_PHOTO_NUM.NEXTVAL, ?, ?, ?)";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, vidx);  // 글 idx (FK)
	        ps.setString(2, pdto.getPname1());
	        ps.setString(3, pdto.getPname2());
	        ps.setString(4, pdto.getPname3());

	        int count = ps.executeUpdate();
	        return count;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return -1;
	    } finally {
	        try {
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	}
	
	
}
