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

	//사진 가져오기 메서드 
	public ArrayList<HotelPhotoDTO> getphoto(int vidx) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "select * from photo where pidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vidx);
			rs = ps.executeQuery();
			ArrayList<HotelPhotoDTO> arr = new ArrayList<HotelPhotoDTO>();
			while(rs.next()) {
				int pidx = rs.getInt("pidx");
				int pnum = rs.getInt("pnum");
				String pname1 = rs.getString("pname1");
				String pname2 = rs.getString("pname2");
				String pname3 = rs.getString("pname3");
				HotelPhotoDTO dto = new HotelPhotoDTO(pidx, pnum, pname1, pname2, pname3);
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

	
	/** 사진 등록 메서드 */ 
	public HotelPhotoDTO photocontent(int vidx) {
	    try {
	        conn = com.hotel.db.HotelDB.getConn();

	        String sql = "select pname1,pname2,pname3 from photo,review where photo.pidx = review.vidx and vidx=?";
	        ps = conn.prepareStatement(sql);
	        ps.setInt(1, vidx); 
	        rs= ps.executeQuery();

	        HotelPhotoDTO dto=null;
	        if(rs.next()) {
	        	String pname1 = rs.getString("pname1");
	        	String pname2 = rs.getString("pname2");
	        	String pname3 = rs.getString("pname3");
	        	dto=new HotelPhotoDTO(pname1, pname2, pname3);
	        }
	        
	        return dto;
	    } catch (Exception e) {
	        e.printStackTrace();
	        return null;
	    } finally {
	        try {
	        	if (rs != null) rs.close();
	            if (ps != null) ps.close();
	            if (conn != null) conn.close();
	        } catch (Exception e2) {
	            e2.printStackTrace();
	        }
	    }
	}
	//사진 업데이트 메서드
	public int photoUpdate(HotelPhotoDTO dto) {
		try {
			conn = com.hotel.db.HotelDB.getConn();
			String sql = "update photo set pname1 = ?, pname2 = ?, pname3 = ? where pidx = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getPname1());
			ps.setString(2, dto.getPname2());
			ps.setString(3, dto.getPname3());
			ps.setInt(4, dto.getPidx());
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}

	
}

