package com.hotel.seoul;

import java.sql.*;
import java.util.*;


public class SeoulWriteDAO {

	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public SeoulWriteDAO() {
		
	}
	
	
	/** 글 쓰기 등록 메서드*/
	public int reviewWrite(SeoulWriteDTO vdto) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			
			String sql = "INSERT INTO REVIEW (VIDX, VID, VTITLE, VCONTENT, VDATE, VTOTAL) VALUES(SQ_REVIEW_IDX.NEXTVAL,?,?,?,SYSDATE,?)";
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, vdto.getVid()); // dto에 있는 변수에 넣음 내가 넣을 변수들
			ps.setString(2, vdto.getVtitle());
			ps.setString(3, vdto.getVcontent());
			ps.setInt(4, vdto.getVtotal());
			
			int count=ps.executeUpdate();
			
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
	
	
	/** 글 쓰기 후 파일을 등록하기 위해 foreign key - vidx 가져오는 메서드 */
	public int FileUploadvidx(int vidx) {
		try {
			conn=com.hotel.db.HotelDB.getConn();
			String sql="SELECT * FROM REVIEW WHERE VIDX = ? ";
			
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, vidx);
			ps.execute();
			return vidx;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				
			}
		}
	}

	
	/** 제일 최신 글 가져오기*/
	public int recentPost() {
	    int vidx = -1; // 기본값: 실패 시 -1
	    try {
	        conn = com.hotel.db.HotelDB.getConn();
	        String sql = "SELECT * FROM (SELECT * FROM review ORDER BY vidx DESC) WHERE ROWNUM = 1";
	        ps = conn.prepareStatement(sql);
	        rs = ps.executeQuery();

	        if (rs.next()) {
	            vidx = rs.getInt("vidx"); 
	        }

	    } catch (Exception e) {
	        e.printStackTrace(); 
	    } finally {
	        try {
	            if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	    return vidx;
	}
	
	
	}


